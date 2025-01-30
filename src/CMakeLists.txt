if (ENABLE_INCLUDE_WHAT_YOU_USE)
  include(../cmake/iwyu.cmake)
endif()

if (ENABLE_ADDRESS_SANITIZER)
  include(../cmake/asan.cmake)
endif()

if (ENABLE_THREAD_SANITIZER)
  include(../cmake/tsan.cmake)
endif()

if (ENABLE_UB_SANITIZER)
  include(../cmake/ubsan.cmake)
endif()

if (ENABLE_GCOV)
  include(../cmake/gcov.cmake)
endif()

if (ENABLE_DOXYGEN)
  include(../cmake/doxygen.cmake)
endif()

if (ENABLE_CPPCHECK)
  include(../cmake/cppcheck.cmake)
endif()

# build the library before binary
add_subdirectory(library)

# Define your executable
add_executable(MyExecutable 
  main.cc
)

# Set include directories for the library
target_include_directories(MyExecutable PUBLIC 
  ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# Link your executable with the library
target_link_libraries(MyExecutable PRIVATE MyLibrary pthread)

# Copy the executable to bin directory
install(TARGETS MyExecutable DESTINATION ${INSTALL_BIN_DIR})

# Install header files
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/
        DESTINATION ${CMAKE_INSTALL_PREFIX}/include
        FILES_MATCHING PATTERN "*.h" PATTERN "*.hpp")

