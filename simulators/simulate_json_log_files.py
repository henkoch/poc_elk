#!/usr/bin/env python3

import json
import logging
import os
import random
import time
from datetime import datetime, timezone

log_file_path = "test_logs/json_msgs.log"

# Log levels and example messages
LOG_LEVELS = ["INFO", "WARNING", "ERROR", "DEBUG"]
LOG_MESSAGES = [
    "User login successful",
    "Failed to connect to database",
    "Service started successfully",
    "Service shut down unexpectedly",
    "Data processing started",
    "Missing configuration file",
    "User session timed out",
    "Disk space running low",
    "Retrying connection",
    "File not found",
    "User logout successful",
    "Cache cleared successfully",
]

def generate_random_log():
    """Generate a single random log entry."""
#        "timestamp": datetime.now(timezone.utc).isoformat(),
    log_entry = {
        "timestamp": datetime.now().isoformat(),
        "level": random.choice(LOG_LEVELS),
        "message": random.choice(LOG_MESSAGES),
        "user_id": random.randint(1000, 5000),
        "session_id": f"{random.randint(100000, 999999)}",
    }
    return log_entry

def simulate_logs(delay=1):
    """Simulate generating JSON log entries and print them to the console."""
    with open(log_file_path, "a") as log_file:
        while True:
            log_entry = generate_random_log()
            log_file.write(json.dumps(log_entry) + "\n")
            log_file.flush()
            print(json.dumps(log_entry))  # Print as JSON string
            time.sleep(delay)
    
if __name__ == "__main__":
    # Simulate 10 log entries with a 1-second delay between them
    simulate_logs(delay=5)

