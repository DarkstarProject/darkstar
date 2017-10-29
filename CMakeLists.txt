cmake_minimum_required(VERSION 3.9)
project(darkstar)

include(cmake/compiler.cmake)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(lib_suffix "_64")
    set(lib_dir lib64)
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set(lib_suffix "")
    set(lib_dir lib)
endif()

link_directories(${lib_dir})

if(CMAKE_CONFIGURATION_TYPES STREQUAL Debug)
    set(lib_debug "-d")
else()
    set(lib_debug "")
endif()

# copy libs to output
file(GLOB files ${lib_dir}/*.lib)
foreach(file ${files})
    file(COPY ${file} DESTINATION ${CMAKE_BINARY_DIR}/bin/${CMAKE_CONFIGURATION_TYPES})
endforeach()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_subdirectory(src)
