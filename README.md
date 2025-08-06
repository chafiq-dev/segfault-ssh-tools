# Segfault SSH Connection Tools

Welcome to the Segfault SSH Connection Tools repository! This project provides a set of scripts and notes to streamline the process of connecting to a temporary SSH server on [segfault.net](https://segfault.net/). The service offers a free, ephemeral environment for exploring Unix, development, and research.

## Purpose

The first time you connect to segfault.net, the server generates a unique private key and configuration for a temporary server instance. This setup can be a manual process. The files in this repository are designed to simplify this by:

-   **Establishing the initial connection** and creating your server instance.
-   **Configuring your local SSH client** for easy access.
-   **Automating common tasks** such as file transfers and a private shell session.

---

## Getting Started

To use these tools, simply clone this repository to your local machine:

```bash
git clone [https://github.com/chafiq-dev/segfault-ssh-tools.git](https://github.com/chafiq-dev/segfault-ssh-tools.git)
````

## File Descriptions

### `scripts/connect-initial.sh`

This script is for your very first connection. It starts the SSH session and creates a new temporary server instance on segfault.net. **Use this once to get your configuration block.**

### `scripts/connect-simplified.sh`

After your initial setup is complete, use this script to connect to your running server instance quickly and easily using the configured alias.

### `scripts/transfer-file-upload.sh`

This script provides a simple, robust way to **upload a file from your local machine to the server**. It uses `base64` encoding, which is helpful if `scp` is slow or blocked.

### `scripts/transfer-file-download.sh`

This script helps you **download a file from the server to your local machine**. It uses a similar `base64` technique to ensure reliable transfer.

### `scripts/quiet-shell.sh`

This script launches a new shell on the remote server with command history disabled, creating a **private and non-logging session**. This is useful for sensitive work where you don't want your commands saved in `~/.bash_history`.

-----

## Security Best Practices

### **⚠️ NEVER share your private key.**

The configuration code provided by segfault.net contains a **private key**. This key grants access to your temporary server instance. **Do not** share it, and **do not** commit it to a public repository. The `.gitignore` file in this repository is configured to help prevent this, but it's essential to be vigilant.

### **Use `quiet-shell.sh` for sensitive tasks.**

For any commands you don't want permanently logged on the server, use the `quiet-shell.sh` script. While the free segfault service is temporary, this practice adds an extra layer of privacy.

-----

## Further Reading

For a more detailed, step-by-step guide on the setup process, please refer to the [notes/setup-guide.md](notes/setup-guide.md) file.
