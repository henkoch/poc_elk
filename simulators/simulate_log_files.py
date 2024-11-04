#!/usr/bin/env python3

import time
import logging
import random

# Configure logging
logging.basicConfig(filename='test_logs/message.log', level=logging.INFO, format='%(asctime)s - %(message)s')

# List of random log messages
log_messages = [
    'User logged in successfully.',
    'Error: Invalid user credentials.',
    'File uploaded successfully.',
    'Warning: Disk space running low.',
    'User logged out.',
    'Error: Unable to connect to database.',
    'Info: Scheduled maintenance at midnight.',
    'Debug: Variable x has value 42.',
    'User password changed successfully.',
    'Error: File not found.'
]

def simulate_log_entry():
    while True:
        # Select a random log entry
        log_message = random.choice(log_messages)
        # Write the log entry
        logging.info(log_message)
        # Wait for 5 seconds
        time.sleep(5)

if __name__ == "__main__":
    simulate_log_entry()