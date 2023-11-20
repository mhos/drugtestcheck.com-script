# Drugtestcheck.com Automation Script

## Overview

- **Creation Date:** 11/19/2023
- **Info:** If you are court-ordered to check into drugtestcheck.com daily, this script helps automate the process for individuals with busy schedules. It checks in and returns the status via email and Telegram.

## Usage

To use this script, you must have a working email server for the email functions. It can be ran from a cronjob of a cPanel hosting account but jail/shell access needs to be enabled.

### Example Cron

1. Upload the script `dtcstatus.sh` to your cPanel account and make it executable (permissions should be 755).
2. Use cPanel "Cron Jobs" tool to create a cron to run during specified court check-in times.
3. Example cron: `0 7 * * * sh /home/user/scripts/dtcstatus.sh` (runs at 7 AM server time).

## Responsibility

The author takes no responsibility for the use of this script if it doesn't work. It is a use-at-your-own-risk situation. If the script fails, and you do not get alerts, it is your own responsibility.

## Requirements

- Working email server for email alerts.
- [Telegram](https://telegram.org/) account and details for Telegram alerts. [Instructions here](https://github.com/mhos/drugtestcheck.com-script/blob/main/TELEGRAM-INFO.md).

## Script Variables

- **Main URL:** `https://drugtestcheck.com`
- **Language Setting:** `en`
- **Call-in Code:** `CHANGE-ME`
- **Last Name:** `CHANGE-ME`

### Email Variables

- **Subject:** `Drug Test Check - [current_datetime]`
- **From Email Address:** `CHANGE-ME`
- **To Email Address:** `CHANGE-ME`

### Telegram Variables

- **API Token:** `CHANGE-ME`
- **Chat ID:** `CHANGE-ME`

## Usage Notes

1. Set the script variables according to your requirements.
2. Replace `CHANGE-ME` with your actual values in the script.
3. Ensure correct permissions on the script (`755` recommended).
4. Configure the cron job for automated execution.
5. Use responsibly and at your own risk.

## Disclaimer

This script is provided as-is. The author is not responsible for any issues or failures in its use.

---
