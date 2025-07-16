# 🗄️ Log Archive CLI Tool

A simple command-line utility to compress and archive log files from a specified directory. Useful for keeping your system clean while retaining important logs for future reference.

---

## 🚀 Features

- 🔧 Compress logs from a specified directory (`tar.gz` format)
- 🕓 Timestamped archive names
- 📂 Stores archives in `~/log_archives/`
- 📝 Logs each archive operation in `archive_log.txt`
- 💡 Minimal dependencies — works out of the box on most Linux systems

---

## ✅ Requirements
Python 3.x

Unix-like OS (Linux, macOS)

Permissions to read the target log directory

## 📦 Installation

### 1. Clone or Download the Script

```bash
git clone https://github.com/yourusername/log-archive.git
cd log-archive
```

### 2. Make the Script Executable
```bash
chmod +x log-archive.py
```

### 3. Install as a Global Command (System-wide)
```bash
sudo mv log-archive.py /usr/local/bin/log-archive

```
✅ Now you can run it from anywhere using:
```bash
log-archive /path/to/logs
```

### Optional: User-Only Installation
```bash
mkdir -p ~/.local/bin
mv log-archive.py ~/.local/bin/log-archive
chmod +x ~/.local/bin/log-archive
```

Then add to your PATH:
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 🛠️ Usage
```bash
log-archive <log-directory>
```
Example:
```bash
log-archive /var/log
```

💡 For system logs like /var/log, run with sudo:

```bash
sudo log-archive /var/log
```

## 📁 Output
Archives saved to: ~/log_archives/logs_archive_<timestamp>.tar.gz

Log file: ~/log_archives/archive_log.txt

