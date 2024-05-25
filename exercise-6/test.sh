#!/bin/bash

# Directory to store memory usage logs
memory_log_directory="./memory_logs"

# Email address to send the memory usage reports
email_recipient="greatvictor.anjorin@gmail.com"

# Function to send memory usage data through email
send_email() {
    # Prepare email subject with formatted date
    email_subject="Memory Usage Report - $(date +"%Y-%m-%d")"

    # Prepare email body
    email_body="This email contains the memory usage report for $(date +"%Y-%m-%d"). The attached log file provides detailed information about memory usage throughout the day. Please review the attachment for a comprehensive analysis."

    # Check if the log file exists before sending
    if [ -f "$memory_log_directory/log_file.log" ]; then
        # Send email with attachment
        echo "$email_body" | mail -s "$email_subject" -a "$memory_log_directory/log_file.log" "$email_recipient"
        mail_result_code=$?

        # Check if the email was sent successfully
        if [ $mail_result_code -eq 0 ]; then
            echo "Memory usage report for $(date +"%Y-%m-%d") sent successfully." >> "$memory_log_directory/success.log"
        else
            echo "Error sending email: $mail_result_code" >> "$memory_log_directory/error.log"
        fi
    else
        # Log file not found
        echo "Memory usage log for $(date +"%Y-%m-%d") not found. Email not sent." >> "$memory_log_directory/error.log"
        exit 1
    fi
}

# Function to reset the log file for the next day
reset_log_file() {
    # Check if the log file exists
    if [ -f "$memory_log_directory/log_file.log" ]; then
        # Reset the log file
        > "$memory_log_directory/log_file.log"
    else
        # Log file not found, create an error message
        echo "Memory usage log for $(date +"%Y-%m-%d") not found. Reset not done." >> "$memory_log_directory/error.log"
        exit 1
    fi
}

# Main function
main() {
    # Create log directory if it doesn't exist
    mkdir -p "$memory_log_directory"

    # Append date and memory usage to log file
    {
        date
        free
        echo "---"
    } >> "$memory_log_directory/log_file.log"

    # Send the email with the memory usage report
    send_email

    # Reset the log file for the next day
    reset_log_file
}

# Call the main function
main