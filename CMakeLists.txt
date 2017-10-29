cmake_minimum_required(VERSION 3.9)
project(darkstar)

include(cmake/compiler.cmake)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(lib_suffix "_64")
    link_directories(lib64)
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set(lib_suffix "")
    link_directories(lib)
endif()

if(CMAKE_CONFIGURATION_TYPES STREQUAL Debug)
    set(lib_debug "-d")
else()
    set(lib_debug "")
endif()

add_subdirectory(src)
