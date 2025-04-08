cmake_minimum_required(VERSION 3.24 FATAL_ERROR)

project(cuda_ground LANGUAGES CUDA CXX)

find_package(CUDAToolkit REQUIRED)
find_package(nvbench REQUIRED)

function(add_cuda_executable name)
    cmake_parse_arguments(ARG "" "" "" ${ARGN})
    add_executable(${name} ${ARG_UNPARSED_ARGUMENTS})
    set_target_properties(${name} PROPERTIES CUDA_ARCHITECTURES "all-major")
    set_target_properties(${name} PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
    set_target_properties(${name} PROPERTIES LINKER_LANGUAGE CUDA)
    set_target_properties(${name} PROPERTIES CXX_STANDARD 20)
    set_target_properties(${name} PROPERTIES CUDA_STANDARD 20)
    target_compile_options(${name} PUBLIC "--extended-lambda")
endfunction()

add_cuda_executable(bench src/bench.cu src/mmm.cu)
target_link_libraries(bench nvbench::main)

add_cuda_executable(example src/example.cu src/mmm.cu)

install(TARGETS bench example)
