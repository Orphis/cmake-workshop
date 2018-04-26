add_library(lib2 lib2.cpp)
target_link_libraries(lib2 PRIVATE lib3)
