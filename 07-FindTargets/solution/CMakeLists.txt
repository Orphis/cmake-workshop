cmake_minimum_required(VERSION 3.6)
project(07-FindTargets)

# Define dummy targets
add_subdirectory(bin1)
add_subdirectory(lib1)
add_subdirectory(lib2)
add_subdirectory(lib3)
add_subdirectory(lib4)
add_subdirectory(lib5)
add_subdirectory(lib6)
add_subdirectory(lib7)
add_subdirectory(lib8)

# List all the targets in the current directory and subdirectories
# Write the result in a variable called ${outname}
function(find_targets outname)
  set(dirlist "${CMAKE_CURRENT_LIST_DIR}")
  set(targets)

  while(dirlist)
    # Pop the first directory from the queue
    list(GET dirlist 0 current_dir)
    list(REMOVE_AT dirlist 0)

    # Read the current directory targets
    get_property(current_dir_targets DIRECTORY "${current_dir}" PROPERTY BUILDSYSTEM_TARGETS)
    list(APPEND targets "${current_dir_targets}")

    # Add the subdirectories into the queue
    get_property(current_subdirs DIRECTORY "${current_dir}" PROPERTY SUBDIRECTORIES)
    if(current_subdirs)
      list(APPEND dirlist "${current_subdirs}")
    endif()
  endwhile()
  
  # return the targets in the variable named ${outname}
  set(${outname} "${targets}" PARENT_SCOPE) 
endfunction()

find_targets(all_targets)
message("All targets: ${all_targets}")
