# Linux Learning Journey

This repo tracks my hands-on projects as I learn Linux from scratch, one project at a time.

## Project 1: File Management Basics
**Commands practiced:** `mkdir -p`, `touch`, `ls`, `mv`, `cp -r`, `rm -r`

**What I did:**
- Created a folder structure (`inbox`, `archive/2024`, `archive/2025`)
- Generated multiple files at once using brace expansion: `touch inbox/report{1..5}.txt`
- Organized files by moving them into dated archive folders
- Practiced copying and safely removing folders along with everything inside them

## Project 2: Linux Detective - Searching & Filtering Text
**Commands practiced:** `wget`, `head`, `tail -f`, `grep`, `find`, pipes (`|`), `awk`, `sort`, `uniq -c`, `tr`

**What I did:**
- Downloaded and analyzed a real Apache web server log file
- Counted 404 errors using `grep "404" | wc -l`
- Ranked the busiest visitor IPs with a chained pipeline: `awk '{print $1}' | sort | uniq -c | sort -rn | head`
- Watched a log file update live with `tail -f`
- Split log lines into individual words with `tr -s ' ' '\n'` to analyze word frequency

## Project 3: Lock Down a Shared Server - Users, Groups & Permissions
**Commands practiced:** `adduser`, `groupadd`, `usermod -aG`, `chmod`, `chown`, `su`, `visudo`

**What I did:**
- Created two users (`alice`, `bob`) and a shared group (`devteam`)
- Set up a shared folder with group-based permissions (`770`) so only `devteam` members could access it
- Decoded the full permission string (`drwxrwx---`) to understand owner/group/other access
- Debugged a real-world permissions bug: a file created by one user didn't inherit the shared group, blocking the other team member from writing to it
- Fixed it with `chown`/`chmod`, then applied the `setgid` bit so future files always inherit the correct group automatically
- Configured precise, passwordless `sudo` access for one user, limited to a single command — real least-privilege security

## Tools used
- Ubuntu (via WSL2 on Windows)
- VS Code with the WSL extension
- Git & GitHub for version control

## Project 4: Tame the Process Zoo - Seeing & Controlling Running Processes
**Commands practiced:** `sleep`, `ps aux`, `grep`, `kill`, `pkill`, `top`

**What I did:**
- Started long-running background processes using `sleep 600 &` and the `&` operator
- Used `ps aux | grep <name>` to find a specific running process and read its PID
- Killed a process by its PID using `kill <PID>` and confirmed it stopped
- Ran multiple background processes at once and identified each one individually by PID and command name
- Killed a process by name instead of PID using `pkill`
- Explored `top`, a live process monitor, and used `M`/`P` to sort by memory/CPU usage

# Project 5: Folder Backup Script

A simple but robust Bash command-line tool that creates timestamped backups of any folder.

## Features

- Validates that a folder name was provided
- Checks that the target folder actually exists before attempting anything
- Creates a uniquely timestamped backup (e.g. `inbox_backup_2026-06-30_16-31-09`) so previous backups are never overwritten
- Proper exit codes (`0` for success, `1` for failure) following standard Unix conventions
- Built-in `--help` flag with usage instructions

## Usage

\`\`\`bash
chmod +x backup.sh
./backup.sh <folder_name>
\`\`\`

### Examples

\`\`\`bash
./backup.sh inbox
# Backup created: inbox_backup_2026-06-30_16-31-09

./backup.sh --help
# Shows usage instructions

./backup.sh nonexistent_folder
# Hmm, I can't find a folder called nonexistent_folder
\`\`\`

## What I learned

- Using positional parameters (`$1`) to accept command-line arguments
- Conditional logic in Bash (`if`/`else`/`fi`) and the `-z` and `-d` test flags
- Capturing command output into variables using `$(...)`
- Building dynamic strings/filenames using variable expansion (`${var}`)
- Proper exit codes and why they matter for scripting and automation
- Copying directories recursively with `cp -r`


