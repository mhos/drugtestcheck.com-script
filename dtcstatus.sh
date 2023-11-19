#!/bin/bash

###############################################################################
#
# Creation Date:
#       11/19/2023
# Info: 
#       If you are court-ordered to check into drugtestcheck.com daily then
#       this script with help automate the process for people with a busy schedule.
#       It checks in and returns the status via email and Telegram.
# Usage:
#       To use this script you must have a working email server if you want
#       to use the email functions of this script.
#       I run it from a cronjob of a cPanel hosting account.
#       ** NOTE ** You need to update the parts containing "CHANGE-ME" with your details ** NOTE **
# Example Cron:
#       First, upload the script dtcstatus.sh to your cPanel account and make it executable.
#       Permissions should be 755 on the dtcstatus.sh script.
#       Use cPanel "Cron Jobs" tool to create a cron to run during your specified court checkin times.
#       The example cron below will run at 7AM server time.
#       EX: 0 7 * * * sh /home/user/scripts/dtcstatus.sh
# Responsibility:
#       I take absolutely no responsibility for the use of this script if it doesn't work.
#       This is a use-at-your own risk situation. If this script fails and you do not get
#       alerts, it is your own fault, Not Mine!
# How to get Telegram alerts details:
#       https://github.com/mhos/drugtestcheck.com-script/blob/main/TELEGRAM-INFO.md
#
###############################################################################

# Set the variables
url="https://drugtestcheck.com"                                         # Main URL
lang="en"                                                               # Language setting
ccode="CHANGE-ME"                                                       # Call-in Code Provided from PO
lname="CHANGE-ME"                                                       # Last 4 letters of your Lastname

# Mail variables
current_datetime=$(date '+%Y-%m-%d %H:%M')                              # Get the current date and time
subject="Drug Test Check - $current_datetime"                           # Subject of email with date and time
from="CHANGE-ME"                                                        # From email address
recipients="CHANGE-ME"                                                  # To email address

# Telegram alerts set the API token and chat ID
API_TOKEN="CHANGE-ME"                                                   # Telegram Bot API Token
CHAT_ID="CHANGE-ME"                                                     # Telegram User Chat ID

# Make the curl request and store the output in a variable
response=$(curl -s -X POST -d "lang=$lang&callInCode=$ccode&lastName=$lname" "$url")

# Extract the first instance of <label for="reply"> using grep, and remove the tags
output_response=$(echo "$response" | grep -m 1 -oP '<label for="reply">.*?</label>' | sed -e 's/<[^>]*>//g')

# Mail/Telegram body
mail="Response from drugtestcheck.com:
$output_response"

# Print the result - Debug or send the email
# echo -e "$mail"
# Use the following line to send the email using the 'mail' command
echo -e "$mail" | mail -s "$subject" -r "$from" "$recipients"

# Send Telegram message - Just comment out if not needed
curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$mail" > /dev/null
