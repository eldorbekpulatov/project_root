# Find Clang-Tidy executable
find_program(CLANG_TIDY_EXECUTABLE NAMES clang-tidy)
if (CLANG_TIDY_EXECUTABLE)
    message(STATUS "Clang-Tidy found: ${CLANG_TIDY_EXECUTABLE}")
    set_target_properties( MyExecutable 
      PROPERTIES CXX_CLANG_TIDY 
      "${CLANG_TIDY_EXECUTABLE};-checks=*"
    )
else()
    message(WARNING "Clang-Tidy not found.")
endif()


