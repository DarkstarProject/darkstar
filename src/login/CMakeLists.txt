cmake_minimum_required(VERSION 3.9)
project(darkstar)

add_definitions(
    -DdsTCPSERV
    -DDEBUGLOGLOGIN
)

file(GLOB GENERATED_SOURCES CONFIGURE_DEPENDS *.cpp)

add_executable(DSConnect-server
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
)

if(UNIX)
    target_include_directories(DSConnect-server PRIVATE
        ${MYSQLCLIENT_INCLUDE_DIRS}
    )

    target_link_libraries(DSConnect-server
        ${MYSQLCLIENT_LIBRARIES}
        ${ZMQ_LIBRARIES}
        ${CMAKE_THREAD_LIBS_INIT}
    )
else()
    target_include_directories(DSConnect-server PRIVATE
        ../common
        ../../win32/external
        ../../win32/external/mysql
        ../../win32/external/zmq
    )

    target_link_libraries(DSConnect-server
        libmariadb${lib_suffix}
        libzmq${lib_debug}${lib_spacer}${lib_suffix}
        WS2_32
    )
endif()
