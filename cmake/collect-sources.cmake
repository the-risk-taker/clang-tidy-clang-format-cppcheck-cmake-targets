file(GLOB_RECURSE ALL_SOURCES *.h *.c *.hpp *.cpp)
list(FILTER ALL_SOURCES EXCLUDE REGEX ${CMAKE_BINARY_DIR})

message(STATUS "All sources collected")