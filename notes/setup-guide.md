# Detailed Segfault SSH Setup Guide

This document explains the full process of connecting to a temporary segfault.net server, from the initial connection to the simplified login.

### Step 1: The Initial Connection

The first step is to connect to the main segfault server. This triggers the creation of your own temporary server instance.

1.  Open your terminal.
2.  Run the initial connection command. The `-L` flags are for port forwarding, which is required for some services.

    ```bash
    ssh -L2900:0:2900 -L5900:0:5900 root@segfault.net
    ```

3.  The first time you connect, you will be prompted to confirm the host's authenticity. Type **yes** and press Enter to proceed.
4.  Enter the `root` password for the segfault.net service.

After a successful login, the server will create your unique temporary server (e.g., "ArtefactGrass") and present you with a block of code.

### Step 2: Configuring Your Local SSH Client

The code block provided by the server is crucial for all future connections. It configures your local machine with a private key and an SSH alias.

The code will look similar to this:

```bash
######################################################################
cat >~/.ssh/id_sf-lsd-segfault-net <<'__EOF__'
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXdjbhkjgAAAABG5vbmUAAAAEbm9uZQAAAAAAAAfdfggfAAMwAAAAtzc2gtZW
QyNTUxOzszzACB3jmp/3zzvY9ABgjrx4+sBnQ0T+yHsB4HTBMcJqC2OtgAAAIiJ9mzOifZs
zgAAAAtzc2gtZdfgdgdfgfdgxOQAdszACB3jmp/3JyvY9ABgjrx4+sBnQ0T+yHsB4HTBMcJqC2Otg
AAAEAs6YNgdSzAfZDl5/vDOB0vv7EZMxMUc/fEipuZ9AsxsxOan/cnK9j0AGsxsHj6wGd
DRP7IewHgdMsxscfY62AAAAAAECAwQF
-----END OPENSSH PRIVATE KEY-----
__EOF__
cat >>~/.ssh/config <<'__EOF__'
host artefactgrass
    User root
    HostName lsd.segfault.net
    IdentityFile ~/.ssh/id_sf-lsd-segfault-net
    SetEnv SECRET=XXXXXXXXXXXXXXXXXXXXXXXX
    LocalForward 5900 0:5900
__EOF__
chmod 600 ~/.ssh/config ~/.ssh/id_sf-lsd-segfault-net
######################################################################
````

1.  **Copy this entire block** from your terminal output.
2.  **Paste it into your terminal** and press Enter.

This script does the following:

  * Creates a private key file at `~/.ssh/id_sf-lsd-segfault-net`.
  * Adds a new `host` entry named `artefactgrass` to your `~/.ssh/config` file.
  * Sets the correct secure permissions on both files with `chmod 600`.

### Step 3: Simplified Connection

Once your `~/.ssh/config` file is set up, you can connect to your temporary server with a simple command.

```bash
ssh artefactgrass
```

This command uses the alias `artefactgrass` defined in your configuration file to automatically use the correct host, username, and private key. This works for other tools as well:

  - `sftp artefactgrass`
  - `scp your_file.txt artefactgrass:/sec/`

**Important:** Your free segfault.net server is temporary and will shut down when you log out. If you log out and want to reconnect, you will need to repeat Step 1 to create a new server instance, which will likely have a new name and private key.
