cmake_minimum_required(VERSION 3.12)

project("CmakeVonrosmo")

# CONFIG required to not hit policy CMP0167 on newer CMake versions
find_package(Boost CONFIG REQUIRED COMPONENTS filesystem)

file(GLOB_RECURSE SRC_FLATSET flatset/*.cpp flatset/*.hpp)
add_library(flatset ${SRC_FLATSET})
target_link_libraries(flatset PRIVATE Boost::headers)

file(GLOB_RECURSE SRC_FILESYSTEM filesystem/*.cpp filesystem/*.hpp)
add_library(filesystem ${SRC_FILESYSTEM})
target_link_libraries(filesystem PRIVATE Boost::filesystem)

add_executable(main main.cpp)
target_link_libraries(main flatset filesystem)
