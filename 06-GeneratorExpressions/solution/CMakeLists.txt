cmake_minimum_required (VERSION 3.5)
project(06-GeneratorExpressions)

# If no build type is specified, make it Release
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

# Create a static library called mylib
add_library(mylib STATIC
  mylib.cpp
  mylib.h
)

# Use a generator expression in OUTPUT_NAME property of mylib to contain the configuration name (Debug, Release...)
# See https://cmake.org/cmake/help/latest/prop_tgt/OUTPUT_NAME.html
set_property(TARGET mylib
  PROPERTY OUTPUT_NAME "mylib$<CONFIG>")
