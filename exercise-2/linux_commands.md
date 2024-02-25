# du

### Description

The `du` command, which stands for "disk usage," is a Linux command used to estimate the space occupied by files and directories on a file system.
It provides information about the size of files and directories, helping one understand how much disk space they consume.
Also, when a directory is included in the set of files, the `du` command can operate recursively.
This means it will not only calculate the size of the specified directory itself but also traverse through its subdirectories,
calculating the total disk usage for the entire directory tree.

### Usage

`du [options] [files or directories]`

- `du -h` or `du --human-readable`: Displays sizes in a human-readable format (e.g., KB, MB, GB).
- `du -s` or `du --summarize`: Displays only the total size of the specified files or directories.

### Screenshots

![Screenshot 1](link to image)


# find

### Description

The `find` command in Linux/Unix is a powerful tool used for searching and locating files and directories within a file system.
It is designed to locate files based on various criteria such as file name, size, modification time, permissions, and more.

### Usage

`find [starting_directory] [options] [expression]`

- `find /path/to/start -name filename.txt`: Locates files by name
- `find /path/to/start -type d`: Lists all directories on the specified path. It also does this recursively.
- `find /path/to/start -mtime -7`: Lists all files and directories in the specified path that has been modified in the past 7 days.
- `find /path/to/start -name "*.log" -exec rm {} \;`: Executes the rm command on any file ending with a `.log` found in the specified path.

### Screenshots

![Screenshot 1](link to image)


# grep

### Description

The `grep` command in Linux/Unix is a powerful and flexible tool used for searching and matching patterns within text. Its name stands for "Global Regular Expression Print".

### Usage

`grep [options] pattern [files]`



### Screenshots
![Screenshot 1](link to image)


# chmod

### Description

The `chmod` command in Linux/Unix is used to change the permissions of files and directories. Its name stands for "change mode," and it allows you to control who can read, write, and execute a file.

### Usage

`chmod [options] permissions file(s)`

### Screenshots
![Screenshot 1](link to image)


# chown

### Description

The `chown` command in Linux/Unix is used to change the ownership of files and directories. Its name stands for "change owner," and it allows you to modify the user and/or group associated with a file or directory.

### Usage

`chown [options] new_owner[:new_group] file(s)`

### Screenshots
![Screenshot 1](link to image)


# lsof

### Description

The `lsof` command in Linux/Unix stands for "List Open Files." It is a powerful and versatile tool used to display information about files and processes that are currently opened by the system.

### Usage

`lsof [options] [files or processes]`

### Screenshots
![Screenshot 1](link to image)


# scp

### Description

The `scp` command in Linux/Unix is used for securely copying files between a local and a remote host, or between two remote hosts. It stands for "Secure Copy Protocol."

### Usage

`scp [options] source destination`

### Screenshots
![Screenshot 1](link to image)


# sed

### Description

The `sed`command, short for "stream editor," is a powerful text processing tool in Unix-like operating systems. It is designed to perform text transformations on an input stream (a file or data from a pipeline) and produce an output stream.

### Usage

`sed [options] 'command' file`

### Screenshots
![Screenshot 1](link to image)


# sort

### Description

The `sort` command in Unix/Linux is used to arrange the lines of a text file or the output of a command in a specific order. By default, it sorts lines in ascending order, but it can be customized to sort in descending order or based on certain fields within the lines.

### Usage

`sort [options] [file]`

### Screenshots
![Screenshot 1](link to image)


## Command Name

### Description

### Usage

### Screenshots
![Screenshot 1](link to image)
