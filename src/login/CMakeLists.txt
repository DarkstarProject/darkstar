cmake_minimum_required(VERSION 3.9)
project(topaz)

add_definitions(
    -DdsTCPSERV
    -DDEBUGLOGLOGIN
)

file(GLOB GENERATED_SOURCES CONFIGURE_DEPENDS *.cpp)

if(UNIX)
    set(resource "")
else()
    set(resource "../../win32/vcxproj/connectserver.rc")
endif()


add_executable(topaz-connect
    ${GENERATED_SOURCES}
    ../common/blowfish.cpp
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

set_target_properties(topaz-connect PROPERTIES OUTPUT_NAME topaz-connect${spacer}${platform_suffix})

if(UNIX)
    target_include_directories(topaz-connect PRIVATE
        ${MYSQLCLIENT_INCLUDE_DIRS}
    )

    target_link_libraries(topaz-connect
        ${MYSQLCLIENT_LIBRARIES}
        ${ZMQ_LIBRARIES}
        ${CMAKE_THREAD_LIBS_INIT}
    )
else()
    target_include_directories(topaz-connect PRIVATE
        ../common
        ../../win32/external
        ../../win32/external/mysql
        ../../win32/external/zmq
    )

    target_link_libraries(topaz-connect
        libmariadb${platform_suffix}
        libzmq${lib_debug}${spacer}${platform_suffix}
        WS2_32
    )
endif()
