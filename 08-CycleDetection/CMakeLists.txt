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

# Detects cycles between libraries and print them
# You should reuse the find_targets() from the previous exercise
# This is a DFS graph traversal algorithm, and should probably use
# recursion.
# Use the target property LINK_LIBRARIES to traverse the graph
function(detect_cycles)
  find_targets(all_targets)
  message("All targets: ${all_targets}")
endfunction()

detect_cycles()
