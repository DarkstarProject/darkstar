cmake_minimum_required(VERSION 3.9)
project(darkstar)

add_definitions(
    -DdsUDPSERV
    -DDEBUGLOGMAP
)

file(GLOB_RECURSE GENERATED_SOURCES CONFIGURE_DEPENDS *.cpp)

if(UNIX)
    set(resource "")
else()
    set(resource "../../win32/vcxproj/gameserver.rc")
endif()

add_executable(DSGame-server
    ${GENERATED_SOURCES}
    ../common/blowfish.cpp
    ../common/detour/DetourAlloc.cpp
    ../common/detour/DetourCommon.cpp
    ../common/detour/DetourNavMesh.cpp
    ../common/detour/DetourNavMeshBuilder.cpp
    ../common/detour/DetourNavMeshQuery.cpp
    ../common/detour/DetourNode.cpp
    ../common/kernel.cpp
    ../common/md52.cpp
    ../common/showmsg.cpp
    ../common/socket.cpp
    ../common/sql.cpp
    ../common/taskmgr.cpp
    ../common/timer.cpp
    ../common/utils.cpp
    ../common/zlib.cpp
    ${resource}
)

set_target_properties(DSGame-server PROPERTIES OUTPUT_NAME DSGame-server${spacer}${platform_suffix})

if(UNIX)
    target_include_directories(DSGame-server PRIVATE
        ${MYSQLCLIENT_INCLUDE_DIRS}
        ${LUAJIT_INCLUDE_DIRS}
    )
    target_link_libraries(DSGame-server
        ${MYSQLCLIENT_LIBRARIES}
        ${ZMQ_LIBRARIES}
        ${LUAJIT_LIBRARIES}
        ${CMAKE_THREAD_LIBS_INIT}
    )

    if(APPLE)
        target_link_options(DSGame-server PUBLIC -pagezero_size 10000 -image_base 100000000)
    endif()
else()
    target_include_directories(DSGame-server PRIVATE
        ../common
        ../../win32/external
        ../../win32/external/mysql
        ../../win32/external/zmq
    )

    target_link_libraries(DSGame-server
        libmariadb${platform_suffix}
        lua51${spacer}${platform_suffix}
        libzmq${lib_debug}${spacer}${platform_suffix}
        WS2_32
    )
endif()
