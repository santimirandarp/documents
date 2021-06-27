<div>

</div>

# Linux Filesystem

## Filesystem hierarchy standard

Layout for the root (`/`), the beginning of the OS. Do not confuse w
root folder. Here root means the top of the filesystem.

-   **usr**: System Wide binaries and files they need live here.
    -   **/usr/bin**: binaries.
    -   **/usr/sbin**: root-user-only binaries.
    -   **/usr/lib\***: libraries are small pieces of software shared by
        programs.
    -   **/usr/share**: wallpapers, icons, manuals, fonts, etc.
    -   **/usr/local/**: contains programs installed from source. For
        example `youtube-dl` was installed using github instructions and
        sits therein. Code we wrote and want available across users
        should be there.
-   **etc**: etcetera. System wide configuration and settings. For
    example `/etc/apt/` contains config files for *apt*. In this case,
    the config file is the source of software. `/etc/calendar/` contains
    config files for the calendar app. Some relevant files are not under
    a directory. For example `/etc/bash.bashrc` is the config file for
    bash, default in many terminal emulators. /etc/alacritty/ hosts the
    config file for the terminal emulator.
-   **opt**: contains some proprietary software. Example: google chrome.
-   **snap**: programs installed through snap package manager. They are
    isolated, self contained packages.
-   **home**: contains the users. We can access normally only to ours,
    and any of them with root privileges. Under `/home/username/` there
    is a ton of data, detailed on the next section.
-   **boot**: all info the system needs to boot.
-   **dev**: devices. hard drives and partitions sda, sda1, sda2
    (numbers being partitions, sda the hard drive)
-   **media**: all mounted devices \'d be there.
-   **proc**: pseudofiles about processes.
-   **run, srv, tmp**:erased when reset system.
-   **sys**: system. Advanced.
-   **/root**

### The Home Directory

So the root directory contains many folders. The most important ones for
beginners are: `/usr` and `/etc`. Programs and even wallpapers are on
*usr* folder. Config files on *etc* folder. All of these are system-wide
settings: they affect all users.

The home directory contains the following directories: *Desktop*,
*Downloads*\..., dirs and files we create, and

.dotfiles as well as *.dotdirectories*. The dot (`.`) in a file hides
the file. There are some important dot directories and files:

1.  .bashrc, .bash_aliases, .profile
2.  .local, .config, .cache
3.  .program (.vimrc etc. etc.)

The first ones are config files, and also where variables are stored,
exported, etc. The second ones are directories. *.local* contain user
scoped programs; *.config* contains user-scoped config files (this
config overwrittes etc config files as expected). The last one might be
a files or a directory. They should be placed under *.config* but for
some reason they are not, and this can\'t be changed as the files are
created on every program-session (if they do not exist). They are
configuration files.

### Symlinks in the filesystem

bin, sbin and all libs are symlinks, not real folders. All of them link
to a correspondent folder under `usr`. For example, `bin` is really a
link to `usr/bin` and so on.
