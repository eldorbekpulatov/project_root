# make the gtest library 
add_subdirectory(lib/googletest)

# make sure we have the include libraries
include_directories(./lib/googletest/googletest/include)
include_directories(../src/include/)
include_directories(../src/library/include/)

set(SOURCE_FILES main_t.cc)
add_executable(MyExecutableTest ${SOURCE_FILES})

target_link_libraries(MyExecutableTest PRIVATE MyLibrary gtest)

install(TARGETS MyExecutableTest DESTINATION ${INSTALL_BIN_DIR})



