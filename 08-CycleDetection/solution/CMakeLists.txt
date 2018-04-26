cmake_minimum_required(VERSION 3.6)
project(08-CycleDetection)

# Define dummy targets
add_subdirectory(bin1)
# Create a cycle lib1 -> lib2 -> lib3 -> lib1
add_subdirectory(lib1)
add_subdirectory(lib2)
add_subdirectory(lib3)

# No cycle
add_subdirectory(lib4)
add_subdirectory(lib5)


# Cycle lib6 -> lib7 -> lib6
add_subdirectory(lib6)
add_subdirectory(lib7)

# No cycle
add_subdirectory(lib8)

# Write a function to detect cycles
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

# Private recursive function
# name is the current target
# stack is the list of previously visited targets
function(detect_cycles_ target stack)
  # Check if the current node is visited
  get_property(is_visited TARGET ${target} PROPERTY CYCLE_VISITED)
  if(is_visited)
    return()
  endif()

  get_property(deps TARGET ${target} PROPERTY LINK_LIBRARIES)

  foreach(dep IN LISTS deps)
    # If a dependency is in the stack of visited nodes, we found a cycle
    if(dep IN_LIST stack)
      message("WARNING! Cycle detected: ${stack};${dep}")
    else()
      # No cycle so far, we need to go deeper!
      detect_cycles_(${dep} "${stack};${dep}")
    endif()
  endforeach()

  # Mark the node visited
  set_property(TARGET ${target} PROPERTY CYCLE_VISITED TRUE)
endfunction()

# Detects cycles between libraries and print them
# You should reuse the find_targets() from the previous exercise
# This is a DFS graph traversal algorithm, and should probably use
# recursion.
# Use the target property LINK_LIBRARIES to traverse the graph
function(detect_cycles)
  find_targets(all_targets)
  message("All targets: ${all_targets}")

  foreach(target IN LISTS all_targets)
    detect_cycles_("${target}" "${target}")
  endforeach()
endfunction()

detect_cycles()
