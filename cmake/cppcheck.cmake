# Find Cppcheck executable
find_program(CPPCHECK_EXECUTABLE NAMES cppcheck)
if (CPPCHECK_EXECUTABLE)
  message(STATUS "USING: ${CPPCHECK_EXECUTABLE}")
  add_custom_target(
    cppcheck
    COMMAND ${CPPCHECK_EXECUTABLE} --enable=all 
            --project=compile_commands.json
            --suppress=missingIncludeSystem
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Running Cppcheck on ${CMAKE_SOURCE_DIR}"
  )
else()
  message(WARNING "CANNOT LOCATE: cppcheck")
endif()

