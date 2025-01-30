# Find Clang-Format executable
find_program(CLANG_FORMAT_EXECUTABLE NAMES clang-format)
if (CLANG_FORMAT_EXECUTABLE)
    message(STATUS "Clang-Format found: ${CLANG_FORMAT_EXECUTABLE}")
    file(GLOB_RECURSE SOURCE_FILES 
            ${CMAKE_SOURCE_DIR}/*.cpp 
            ${CMAKE_SOURCE_DIR}/*.h)
    add_custom_target(
        clang-format
        COMMAND ${CLANG_FORMAT_EXECUTABLE} -i -style=file ${SOURCE_FILES}
        COMMENT "Running Clang-Format on ${SOURCE_FILES}"
    )
    # Make the 'clang-format' target part of the default build
    add_dependencies(MyExecutable clang-format)
else()
    message(WARNING "Clang-Format not found.")
endif()
