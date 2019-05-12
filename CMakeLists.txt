cmake_minimum_required(VERSION 3.9)
project(darkstar)

set(CMAKE_VERBOSE_MAKEFILE ON)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(compiler)

if(UNIX)
    find_package(PkgConfig REQUIRED)

    include(FindThreads)

    pkg_search_module(MYSQLCLIENT mariadb)
    if(NOT MYSQLCLIENT_FOUND)
        pkg_search_module(MYSQLCLIENT REQUIRED mysqlclient)
    endif()
    pkg_search_module(ZMQ REQUIRED libzmq)
    pkg_search_module(LUAJIT REQUIRED luajit)
else()
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        set(platform_suffix "64")
        set(spacer "_")
        set(lib_dir lib64)
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
        set(platform_suffix "")
        set(spacer "")
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
