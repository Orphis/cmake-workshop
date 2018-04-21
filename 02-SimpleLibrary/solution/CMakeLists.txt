cmake_minimum_required (VERSION 3.1)
project(02-HelloWorld)

# Create a static library called hellolib
add_library(hellolib STATIC
  hellolib.cpp
  hellolib.h
)

# Create an executable helloworld using the library
add_executable(helloworld
  helloworld.cpp
)
target_link_libraries(helloworld hellolib)
