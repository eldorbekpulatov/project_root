find_program(IWYU_EXECUTABLE NAMES include-what-you-use)
if(IWYU_EXECUTABLE)
  message(STATUS "USING: ${IWYU_EXECUTABLE}")
  set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE "include-what-you-use")
else()
  message(WARNING "CANNOT LOCATE: include-what-you-use")
endif()
