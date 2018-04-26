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
endfunction()

find_targets(all_targets)
message("All targets: ${all_targets}")
