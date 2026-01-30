# WMT — Windows Maintenance Tool

A simple PowerShell tool for basic Windows maintenance and cleanup, focused on keeping the system clean, organized, and performing better in daily use.

This project was created to automate recurring tasks such as cleaning temporary files, emptying the Recycle Bin, and organizing the Downloads folder.

---

## 🚀 Features

- System temporary files cleanup
- Recycle Bin emptying
- Downloads folder organization (old files)
- Modular execution (separate scripts)
- Automatic log generation
- Automatic maintenance weekly
- Compatible with Windows PowerShell 5.1+

---

## 🛡️ Notes

- Scripts use only native Windows commands
- Project uses ASCII characters only
- It is recommended to test the scripts before using them in production

---

## ▶️ How to Run

The script behavior can be controlled in the `config.ps1` file through the `$DRY_RUN` variable, where `true` runs in simulation mode (no files are removed) and `false` performs the actual cleanup.

To execute the tool, open PowerShell and run the following commands:
`Set-ExecutionPolicy Bypass -Scope Process` then `./run.ps1`.

The execution policy change applies only to the current PowerShell session and does not affect system-wide security settings.

---

## ⏰ Schedule Task
Automatic maintenance can be scheduled to run weekly using the script `.\install-task.ps1`.