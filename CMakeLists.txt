cmake_minimum_required(VERSION 2.8...3.5)
if (CMAKE_VERSION VERSION_LESS 3.0)
  project(Main C CXX)
    set(CMAKE_PROJECT_VERSION 1.0.1)
    set(CMAKE_PROJECT_VERSION_MAJOR 1)
    set(CMAKE_PROJECT_VERSION_MINOR 0)
    set(CMAKE_PROJECT_VERSION_PATCH 1)
else()
  cmake_policy(SET CMP0048 NEW)
  project(Main 
    VERSION 1.0.1
    DESCRIPTION "Template CPP project"
    HOMEPAGE_URL "www.github.com/eldorbekpulatov/template_cpp"
    LANGUAGES C CXX)
endif()


# Find GCC|CLANG executable
find_program(GCC_EXECUTABLE NAMES gcc)
find_program(GPP_EXECUTABLE NAMES g++)
find_program(CLANG_EXECUTABLE NAMES clang)
find_program(CLANGPP_EXECUTABLE NAMES clang++)
if(GCC_EXECUTABLE AND GPP_EXECUTABLE)
  message(STATUS "USING: ${GCC_EXECUTABLE}") 
  message(STATUS "USING: ${GPP_EXECUTABLE}")
  set(CMAKE_C_COMPILER gcc)
  set(CMAKE_CXX_COMPILER g++)
elseif(CLANG_EXECUTABLE AND CLANGPP_EXECUTABLE)  
  message(STATUS "USING: ${CLANG_EXECUTABLE}")
  message(STATUS "USING: ${CLANGPP_EXECUTABLE}")
  set(CMAKE_C_COMPILER clang)
  set(CMAKE_CXX_COMPILER clang++)
endif()


set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)  


set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})
set(INSTALL_BIN_DIR ${PROJECT_SOURCE_DIR}/bin)
set(INSTALL_LIB_DIR ${PROJECT_SOURCE_DIR}/lib)

option(ENABLE_INCLUDE_WHAT_YOU_USE "Enable Include-What-You-Use" ON)
if (ENABLE_INCLUDE_WHAT_YOU_USE)
  include(cmake/iwyu.cmake)
endif()

option(ENABLE_ADDRESS_SANITIZER "Enable AddressSanitizer" ON)
if (ENABLE_ADDRESS_SANITIZER)
  include(cmake/asan.cmake)
endif()

option(ENABLE_GCOV "Enable Code Coverage" ON)
if (ENABLE_GCOV)
  include(cmake/gcov.cmake)
endif()

option(ENABLE_DOXYGEN "Enable Doxygen" ON)
if (ENABLE_DOXYGEN)
  include(cmake/doxygen.cmake)
endif()

option(ENABLE_CPPCHECK "Enable CppCheck" ON)
if (ENABLE_CPPCHECK)
  include(cmake/cppcheck.cmake)
endif()


# Add the subdirectories
add_subdirectory(src)
# add_subdirectory(test)




#include(cmake/clang-format.cmake)
#include(cmake/clang-check.cmake)
#include(cmake/clang-tidy.cmake)
