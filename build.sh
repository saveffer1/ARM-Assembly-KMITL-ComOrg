#!/bin/bash

# Read input from user for folder name
read -p "Enter folder name: " folder_name

# Create directory with input folder name
mkdir "$folder_name"

chmod 777 "$folder_name"

# Create file "program.s" in input folder
touch "$folder_name/program.s"

# Write assembly code to program.s
echo ".global _start" >> "$folder_name/program.s"
echo "_start:" >> "$folder_name/program.s"
echo "" >> "$folder_name/program.s"
echo "_exit:" >> "$folder_name/program.s"
echo "    MOV r7, #1" >> "$folder_name/program.s"
echo "    SWI 0" >> "$folder_name/program.s"

echo "Folder and file created successfully."
