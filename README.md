# Linux Security Master

**Linux Security Master** is a comprehensive toolkit designed to help secure your Linux system by automating the installation and configuration of essential security tools. This project aims to provide an easy and efficient way to harden your Linux environment, making it more resilient to attacks and vulnerabilities.

## Features

The `setup.sh` script provided in this project will:

- Install essential security tools (e.g., Nmap, RKHunter, AIDE, ClamAV, UFW, Lynis, Suricata, and more).
- Configure a basic firewall using UFW to block all incoming connections except SSH.
- Harden SSH by disabling root login and enforcing the use of SSH keys.
- Enforce strong password policies, such as a minimum password length.
- Set up automatic security updates using unattended upgrades.
- Initialize and configure AIDE (Advanced Intrusion Detection Environment) for file integrity monitoring.
- Set up RKHunter for rootkit detection.
- Create directories to store logs and scripts for regular security checks.
- Move security scripts to their appropriate directories and make them executable.
- Configure cron jobs to run hourly security checks using the provided security scripts.

## Security Tools

The following security tools will be installed and configured:

- **Nmap**: Network scanning tool.
- **RKHunter**: Rootkit detection tool.
- **AIDE**: File integrity monitoring tool.
- **ClamAV**: Antivirus software.
- **UFW**: Uncomplicated Firewall.
- **Wireshark**: Network protocol analyzer.
- **Suricata**: Intrusion detection system.
- **Auditd**: Auditing framework.
- **Lynis**: Security auditing tool.
- **Unattended-upgrades**: Automatic updates for security patches.
- **ModSecurity**: Web application firewall for Apache (optional, if using Apache web server).

## Prerequisites

Before running this script, ensure that you have:

- A Linux distribution that supports `apt` (e.g., Ubuntu, Debian).
- `sudo` privileges on the system.
- SSH access to the machine if running remotely.

## Installation and Setup

### Step 1: Clone the repository

First, clone this repository to your local machine or server:

```bash
git clone https://github.com/yourusername/linux-security-master.git
cd linux-security-master
```

### Step 2: Make the script executable

Make sure the setup.sh script has the proper executable permissions:

```bash
chmod +x setup.sh
```

### Step 3: Run the setup script

Now, run the script using the following command:

```bash
sudo ./setup.sh
```

### Step 4: Monitoring and Regular Security Checks

Once the setup is complete, security scripts will automatically run every hour through cron jobs. These scripts will:

- Check for failed login attempts.
- Monitor network activity.
- Scan for rootkits.
- Scan network devices.
- Check for open ports on routers.

The logs for these activities will be stored in the ~/security-logs/ directory.

### Step 5: Manual Usage

You can also run any of the security scripts manually. They are located in the ~/security-scripts/ directory.

#### Example to run a specific security script manually

```bash
bash ~/security-scripts/check_login_attempts.sh
```

## Cron Jobs

The following cron jobs are configured to run hourly for continuous monitoring:

```bash
0 * * * * /bin/bash ~/security-scripts/check_login_attempts.sh
0 * * * * /bin/bash ~/security-scripts/network_monitor.sh
0 * * * * /bin/bash ~/security-scripts/rootkit_scanner_script.sh
0 * * * * /bin/bash ~/security-scripts/scan_network_devices.sh
0 * * * * /bin/bash ~/security-scripts/scan_router_ports.sh
```

You can view or modify the cron jobs by using the command:

```bash
crontab -e
```

## Contributing

Feel free to fork this repository, open issues, and submit pull requests. All contributions are welcome to enhance the security and usability of Linux Security Master. :) 

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Disclaimer

This project is intended to help you secure your Linux system, but it does not guarantee 100% security. Always keep your software updated and review security logs regularly.
