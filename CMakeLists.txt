cmake_minimum_required(VERSION 3.22)

project(CppStarter LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(cmake/collect-sources.cmake)
include(cmake/clang-format.cmake)
include(cmake/clang-tidy.cmake)
include(cmake/cppcheck.cmake)

if(MSVC)
    add_compile_options(/W4 /WX)
else()
    add_compile_options(-Wall -Wextra -Wpedantic -Werror)

    if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
        add_compile_options (-fdiagnostics-color=always)
    elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
        add_compile_options (-fcolor-diagnostics)
    endif ()
endif()

add_executable(main main.cpp)
