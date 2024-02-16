# Find lcov executable
find_program(LCOV_EXECUTABLE NAMES lcov)
find_program(GENHTML_EXECUTABLE NAMES genhtml)
if (LCOV_EXECUTABLE AND GENHTML_EXECUTABLE)
  message(STATUS "USING: ${LCOV_EXECUTABLE}")
  message(STATUS "USING: ${GENHTML_EXECUTABLE}")

  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --coverage")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --coverage")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage")

  set(COVERAGE_INPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/src)
  set(COVERAGE_OUTPUT_DIR ${PROJECT_SOURCE_DIR}/cov)

  add_custom_target(coverage
    COMMAND lcov 
            --ignore-errors inconsistent,inconsistent 
            --directory ${COVERAGE_INPUT_DIR} 
            --capture 
            --output-file coverage.info
    COMMAND genhtml coverage.info
            --ignore-errors inconsistent,inconsistent 
            --output-directory ${COVERAGE_OUTPUT_DIR}
    COMMENT "Generating coverage report."
  ) 
else()
  message(WARNING "CANNOT LOCATE: lcov + genhtml")
endif() 

