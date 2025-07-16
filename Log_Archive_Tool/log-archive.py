#!/usr/bin/env python3

import argparse
import os
import tarfile
import datetime
from pathlib import Path

def archive_logs(source_dir):
    # Expand source path and validate it
    source_path = Path(source_dir).expanduser().resolve()
    if not source_path.exists() or not source_path.is_dir():
        raise ValueError(f"Provided path '{source_path}' is not a valid directory.")

    # Create destination directory for archives
    archive_dir = Path.home() / "log_archives"
    archive_dir.mkdir(parents=True, exist_ok=True)

    # Generate archive filename
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    archive_name = f"logs_archive_{timestamp}.tar.gz"
    archive_path = archive_dir / archive_name

    # Create tar.gz archive
    with tarfile.open(archive_path, "w:gz") as tar:
        tar.add(source_path, arcname=source_path.name)

    # Write to log file
    log_file = archive_dir / "archive_log.txt"
    with open(log_file, "a") as f:
        f.write(f"{timestamp} - Archived {source_path} to {archive_path}\n")

    print(f"✅ Logs from '{source_path}' archived to '{archive_path}'")

def main():
    parser = argparse.ArgumentParser(description="Archive log directory into a compressed tar.gz file.")
    parser.add_argument("log_directory", help="Path to the log directory to archive")

    args = parser.parse_args()
    try:
        archive_logs(args.log_directory)
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    main()