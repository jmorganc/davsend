# davsend
Utility to upload files via WebDAV from the command line.

## Usage
1. Either save the file to or link from /usr/local/bin/davsend
2. Make the file executable
3. ```davsend file.ext```

## Sublime Text Integration
Create a new build system with the following:
```
{
    "shell_cmd": "davsend $file_name"
}
```
Use Ctrl+B to upload your file.

Optionally, you can install the SublimeOnSaveBuild package and the file will be automatically uploaded when you save.