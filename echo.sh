#!/bin/bash

# Read input from user for folder name
read -p "Enter folder name: " folder_name

# Change to the input folder
cd "$folder_name"

# Assemble myProg.s to create myProg.o
as -o program.o program.s

# Link myProg.o to create Program
ld -o program program.o

# Run the resulting executable
./program ; echo $?

# Change back to the original directory
cd ..
