find_program(CLANG_FORMAT clang-format)

if(NOT CLANG_FORMAT)
    message(STATUS "Clang-Format was not found, automatic code format targets are inaccessible")
else()
    add_custom_target(clang-format COMMAND ${CLANG_FORMAT} -i ${ALL_SOURCES}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        USES_TERMINAL 
        COMMENT "Formatting code with Clang-Format"
    )

    add_custom_target(clang-format-check COMMAND ${CLANG_FORMAT} --dry-run --Werror ${ALL_SOURCES}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        USES_TERMINAL
        COMMENT "Checking format with Clang-Format check"
    )

    message(STATUS "Clang-Format was found, 'clang-format' and 'clang-format-check' targets can be used")
endif()
