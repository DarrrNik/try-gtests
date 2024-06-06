cmake_minimum_required(VERSION 3.29.3)
project(try_gtests)
set(CMAKE_BUILD_TYPE Release)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#include(FetchContent)
#FetchContent_Declare(
#  googletest
#  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
#)
## For Windows: Prevent overriding the parent project's compiler/linker settings
##set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
#FetchContent_MakeAvailable(googletest)

add_subdirectory()

add_library(Math src/Math.cpp)
target_include_directories(Math PUBLIC include)

add_executable(try_gtests src/main.cpp)
target_include_directories(try_gtests
 PUBLIC
 include)
target_link_libraries(try_gtests Math)

enable_testing()
add_executable(tests tests/src/main.cpp)
target_include_directories(tests PUBLIC tests/include "C:/Program Files/gtest_x64-windows/include")
target_link_libraries(tests Math GTest::gtest_main)

include(GoogleTest)
gtest_discover_tests(tests)