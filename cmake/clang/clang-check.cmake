# Find Clang-Check executable
find_program(CLANG_CHECK_EXECUTABLE NAMES clang-check)
if (CLANG_CHECK_EXECUTABLE)
    message(STATUS "Clang-Check found: ${CLANG_CHECK_EXECUTABLE}")    
    set_target_properties( MyExecutable 
      PROPERTIES CXX_CLANG_CHECK 
      "${CLANG_CHECK_EXECUTABLE};-analyze"
    )
else()
    message(WARNING "Clang-Check not found.")
endif()
