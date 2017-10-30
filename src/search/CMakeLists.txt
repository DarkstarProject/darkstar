cmake_minimum_required(VERSION 3.9)
project(darkstar)

add_definitions(
    -DDEBUGLOGSEARCH
)

add_executable(DSSearch-server
    data_loader.cpp
    packets/auction_history.cpp
    packets/auction_list.cpp
    packets/linkshell_list.cpp
    packets/party_list.cpp
    packets/search_comment.cpp
    packets/search_list.cpp
    search.cpp
    tcp_request.cpp
    ../common/blowfish.cpp
    ../common/md52.cpp
    ../common/showmsg.cpp
    ../common/sql.cpp
    ../common/taskmgr.cpp
    ../common/timer.cpp
    ../common/utils.cpp
)

if(UNIX)
    target_include_directories(DSConnect-server PRIVATE
        /usr/include/mysql
    )

    target_link_libraries(DSConnect-server
        mysqlclient
        zmq
        pthread
    )
else()
    target_include_directories(DSSearch-server PRIVATE
        ../common
        ../../win32/external
        ../../win32/external/mysql
    )
    target_link_libraries(DSSearch-server
        libmariadb${lib_suffix}
        WS2_32
    )
endif()
