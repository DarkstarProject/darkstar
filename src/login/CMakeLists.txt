cmake_minimum_required(VERSION 3.9)
project(darkstar)

add_definitions(
    -DdsTCPSERV
    -DDEBUGLOGLOGIN
)

add_executable(DSConnect-server
    account.cpp
    message_server.cpp
    lobby.cpp
    login.cpp
    login_auth.cpp
    login_session.cpp
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
        mysqlclient
        zmq
        pthread
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
        libzmq${lib_debug}${lib_suffix}
        WS2_32
    )
endif()
