# Find Cppcheck executable
find_program(CPPCHECK_EXECUTABLE NAMES cppcheck)
if (CPPCHECK_EXECUTABLE)
  message(STATUS "USING: ${CPPCHECK_EXECUTABLE}")
  add_custom_target(
    cppcheck
    COMMAND ${CPPCHECK_EXECUTABLE} --enable=all
            --suppress=missingIncludeSystem
            --suppress=missingInclude
            --suppress=checkersReport
            --checkers-report=cppcheck_report.txt
            --cppcheck-build-dir=${CMAKE_BINARY_DIR}
            -i${CMAKE_SOURCE_DIR}/test/lib/ # exclude
            ${CMAKE_SOURCE_DIR}/src
            ${CMAKE_SOURCE_DIR}/test
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Running Cppcheck on ${CMAKE_SOURCE_DIR}"
  )
else()
  message(WARNING "CANNOT LOCATE: cppcheck")
endif()
