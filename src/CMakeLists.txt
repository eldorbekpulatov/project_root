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
target_link_libraries(MyExecutable PRIVATE MyLibrary)

# Copy the executable to bin directory
install(TARGETS MyExecutable DESTINATION ${INSTALL_BIN_DIR})
