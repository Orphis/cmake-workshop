cmake_minimum_required(VERSION 3.1)
project(05-Testing)

# Build 2 executables: passing and failing
add_executable(passing passing.cpp)
add_executable(failing failing.cpp)

# Define 2 tests, one for each executable.
enable_testing()
add_test(NAME passing COMMAND passing)
add_test(NAME failing COMMAND failing)

# Failing will fail, mark at as an exepected failure
set_property(TEST failing
  PROPERTY WILL_FAIL TRUE)
