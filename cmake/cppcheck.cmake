find_program(CPPCHECK cppcheck)

if(NOT CPPCHECK)
    message(STATUS "Cppcheck was not found, static-analysis targets are inaccessible")
else()
    add_custom_target(cppcheck-check COMMAND ${CPPCHECK} --enable=all --error-exitcode=1 --platform=native -i${CMAKE_CURRENT_BINARY_DIR} --project=${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        USES_TERMINAL
        COMMENT "Checking code with Cppcheck"
    )
    
    message(STATUS "Cppcheck was found, 'cppcheck-check' target can be used")
endif()
