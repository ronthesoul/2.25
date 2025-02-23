#!/usr/bin/env bash

echo "Listing specific profile-related files on the system:"
profile_files=($(ls -d ~/.profile ~/.bashrc ~/.bash_logout ~/.bash_login /etc/profile /etc/profile.d 2>/dev/null))
echo "Stored profile-related files in an array: ${profile_files[@]}"
echo "Task 1 completed."

for file in "${profile_files[@]}"; do
    if [[ -f "$file" ]]; then
        echo "export UNIQUE_VAR_$(basename $file)=example_value" >> "$file"
     	echo "alias unique_alias_$(basename $file)='echo Alias from $(basename $file)'" >> "$file"
    	echo "unique_function_$(basename $file)() { echo Function from $(basename $file); }" >> "$file"
    fi
done
echo "Task 3 completed."
    
