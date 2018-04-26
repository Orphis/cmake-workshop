cmake_minimum_required(VERSION 3.1)
project(03-ModernLibrary)

# Build the source in this folder
# Recurse in the mybin and mylib folder where you will create an executable and library
add_subdirectory(mybin)
add_subdirectory(mylib)
