cmake_minimum_required(VERSION 3.29.3)
project(try_gtests)
set(CMAKE_BUILD_TYPE Release)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(gtest)

add_library(Math src/Math.cpp)
target_include_directories(Math PUBLIC include)

add_executable(try_gtests src/main.cpp)
target_include_directories(try_gtests
 PUBLIC
 include)
target_link_libraries(try_gtests Math)

enable_testing()
add_executable(tests tests/src/main.cpp)
target_include_directories(tests PUBLIC tests/include "gtest/googletest/include")
target_link_libraries(tests Math GTest::gtest_main)

include(GoogleTest)
gtest_discover_tests(tests)