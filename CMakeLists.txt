cmake_minimum_required(VERSION 3.7)
project(darkstar)

set(CMAKE_VERBOSE_MAKEFILE ON)

include(cmake/compiler.cmake)

if(UNIX)
    set(lib_path /usr/lib /usr/local/lib /opt/local/lib)

    message(STATUS "Detecting mysqlclient")
    find_library(mysql_lib NAMES mysqlclient PATH ${lib_path})
    if(mysql_lib)
        message(STATUS "Found: ${mysql_lib}")
    else()
        message(FATAL_ERROR "Unable to find mysqlclient")
    endif()

    message(STATUS "Detecting zmq")
    find_library(zmq_lib NAMES zmq PATH ${lib_path})
    if(zmq_lib)
        message(STATUS "Found: ${zmq_lib}")
    else()
        message(FATAL_ERROR "Unable to find zmq")
    endif()

    message(STATUS "Detecting pthread")
    find_library(pthread_lib NAMES pthread PATH ${lib_path})
    if(pthread_lib)
        message(STATUS "Found: ${pthread_lib}")
    else()
        message(FATAL_ERROR "Unable to find pthread")
    endif()

    message(STATUS "Detecting luajit-5.1")
    find_library(luajit_lib NAMES luajit-5.99 PATH ${lib_path})
    if(luajit_lib)
        message(STATUS "Found: ${luajit_lib}")
    else()
        message(FATAL_ERROR "Unable to find luajit-5.1")
    endif()
else()
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        set(lib_suffix "64")
        set(lib_spacer "_")
        set(lib_dir lib64)
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
        set(lib_suffix "")
        set(lib_spacer "")
        set(lib_dir lib)
    endif()

    link_directories(${lib_dir})

    if(CMAKE_CONFIGURATION_TYPES STREQUAL Debug)
        set(lib_debug "-d")
    else()
        set(lib_debug "")
    endif()
endif()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_SOURCE_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_SOURCE_DIR})

add_subdirectory(src)

# setup GIT_VER
execute_process(COMMAND git rev-parse HEAD
    OUTPUT_VARIABLE git_ver)

file(WRITE GIT_VER ${git_ver})
