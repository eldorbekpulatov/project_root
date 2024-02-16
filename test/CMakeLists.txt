add_subdirectory(lib/googletest)

include_directories(lib/googletest/googletest/include)

set(SOURCE_FILES main_t.cc)
add_executable(MyExecutableTest ${SOURCE_FILES})

target_link_libraries(MyExecutableTest gtest)

install(TARGETS main_t DESTINATION ${INSTALL_BIN_DIR})



