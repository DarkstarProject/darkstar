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
    # TODO: add libs and includes
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

    # TODO: see if this can work
    #set_target_properties(DSSearch-server PROPERTIES STATIC_LIBRARY_FLAGS "\" LinkLibraryDependencies=\"true")
endif()
