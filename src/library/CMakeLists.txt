# Define your library
add_library(MyLibrary  
    mylibrary.cc
)


# Set include directories for the library
target_include_directories(MyLibrary PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)


# Copy the executable to bin directory
install(TARGETS MyLibrary DESTINATION ${INSTALL_LIB_DIR})
