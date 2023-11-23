#!/bin/bash

echo "Total number of folders (including all nested ones) = $(find $1 -mindepth 1 -type d | wc -l)"

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$(find $1* -type d -exec du -h {} +|sort -hr| head -5 | awk '{print NR, "-", $2"/, "  $1}')"

echo "Total number of files = $(find $1* -type f | wc -l)"

echo "Number of:"
echo "Configuration files (with the .conf extension) = $(find $1* -type f -name "*.conf" | wc -l)"

echo "Text files = $(find $1* -type f -name "*.txt" | wc -l)"

echo "Executable files = $(find $1* -type f -name -executable | wc -l)"

echo "Log files (with the extension .log) = $(find $1* -type f -name "*.log" | wc -l)"

echo "Archive files = $(find $1* -type f -name "*.zip" -o -name "*.rar" -o -name "*.tar" -o -name "*.7z" | wc -l)"

echo "Symbolic links = $(find $1* -type l | wc -l)"

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
for ((i=1; i<=10; i++))
do
    file=$(find $1* -type f -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d")
    if ! [[ -z $file ]]; then
        echo -n "$i - "
        echo -n "$(echo $file | awk '{print $2",", $1}'), "
        echo "$(echo $file | grep -m 1 -o -E "\.[^/.]+$" | awk -F . '{print $2}')"
    fi
done

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
for ((i=1; i<=10; i++))
do
    file=$(find $1*  -type f -executable -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d")
    if ! [[ -z $file ]]; then
        echo -n "$i - "
        echo -n "$(echo $file | awk '{print $2",", $1}'), "
        path=$(echo $file | awk '{print $2}')
        hash=$(md5sum $path | awk '{print $1}')
        echo "$hash"
    fi
done


