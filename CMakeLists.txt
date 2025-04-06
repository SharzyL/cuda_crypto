cmake_minimum_required(VERSION 3.24 FATAL_ERROR)

project(cuda_ground LANGUAGES CUDA CXX)

find_package(CUDAToolkit REQUIRED)
find_package(nvbench REQUIRED)

add_executable(main src/main.cu)

add_executable(bench src/bench.cu)
target_link_libraries(bench nvbench::main)

install(TARGETS main)

