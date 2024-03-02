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
    HOMEPAGE_URL "www.github.com/eldorbekpulatov/project_root"
    LANGUAGES C CXX)
endif()


set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)  
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")


option(ENABLE_GCOV "Enable Coverage" ON)
option(ENABLE_DOXYGEN "Enable Doxygen" ON)
option(ENABLE_CPPCHECK "Enable CppCheck" ON)
option(ENABLE_THREAD_SANITIZER "Enable ThreadSanitizer" OFF)
option(ENABLE_ADDRESS_SANITIZER "Enable AddressSanitizer" OFF)
option(ENABLE_INCLUDE_WHAT_YOU_USE "Enable Include-What-You-Use" ON)


# Add the subdirectories
add_subdirectory(src)
add_subdirectory(test)


#include(cmake/clang-format.cmake)
#include(cmake/clang-check.cmake)
#include(cmake/clang-tidy.cmake)
