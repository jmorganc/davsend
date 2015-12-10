# davsend
Utility to upload files via WebDAV from the command line.

## Usage
davsend file.ext

## Sublime Text Integration
Create a new build system with the following:
```
{
    "shell_cmd": "davsend $file_name"
}
```
Use Ctrl+B to upload your file.

Optionally, you can install the SublimeOnSaveBuild package and the file will be automatically uploaded when you save.