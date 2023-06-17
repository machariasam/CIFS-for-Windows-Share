Mounting Windows Shares in Linux Using CIFS
--------------------------------------------

This guide provides step-by-step instructions on how to mount Windows shares in Linux using the Common Internet File System (CIFS) protocol.

Table of Contents
------------------
- Introduction
- Prerequisites
- Installation
- Configuration
- Mounting Windows Shares
- Troubleshooting
- Contributing
- License

Introduction
----------------
The CIFS protocol allows Linux systems to access shared folders hosted on Windows machines. This guide will walk you through the process of mounting Windows shares on your Linux system using CIFS.

Prerequisites
----------------
Before proceeding, ensure that you have the following prerequisites:
- Linux distribution installed (e.g., CentOS, Ubuntu)
- Administrative access or sudo privileges
- Network connectivity to the Windows share

Installation
---------------
1. Open a terminal or SSH into your Linux system.
2. Run the following command to install the required CIFS utilities:

    ```
    sudo apt install cifs-utils    # For Debian-based systems
    sudo yum install cifs-utils    # For RPM-based systems
    ```

Configuration
----------------
To mount the Windows share, we need to provide the necessary credentials and server details. Follow these steps to configure the required information:
1. Open a terminal or SSH into your Linux system and change to user root
2. Clone this repository in your linux home directory.
3. Navigate to your local repository and using a text editor or terminal editor, open either `windows_logins` or `nas_share_logins` file, replace the placeholders with your own values:

    ```
    username=username
    password=password
    SERVER_IP=IP_Address
    share_name=share_name/share_folder
    ```

    Make sure to replace `username` with the appropriate username, `password` with the actual password, `IP_Address` with the IP address of the Windows share, and `share_name/share_folder` with the name of the share.

4. Save and close the file.

Mounting Windows Shares
-------------------------
Now that the configuration is complete, we can proceed with mounting the Windows share:
1. Open a terminal or SSH into your Linux system and navigate to the cloned folder.
2. Run the following command to make the mount script executable

    ```
    sudo chmod +x cifs_mount.sh
    ```

3. Executing the CIFS Mount Script

    ```
    sudo cifs_mount.sh
    ```

4. If the mount is successful, you should now be able to access the Windows share's contents under the mount point directory (`/mnt/$share_name`). The windows share will be automatically mounted during system boot.

Troubleshooting
----------------
If you encounter any issues during the mounting process, consider the following troubleshooting steps:
- Verify the correctness of the credentials and server details in the `windows_logins` or `nas_share_logins` file.
- Ensure that the network connectivity to the Windows share is established.
- Check for any firewall rules or security restrictions that may be blocking the CIFS traffic.
- Review the system logs (`/var/log/syslog` or `/var/log/messages`) for any relevant error messages.

If the issue persists, feel free to reach out for further assistance.

Contributing
--------------
We welcome contributions to improve this guide and make it more comprehensive. If you have any suggestions, enhancements, or bug fixes, please submit a pull request.

License
----------
This guide is released under the MIT License.

We appreciate your interest and hope this guide was helpful to you. Happy sharing!

