cmake_minimum_required(VERSION 3.9)
project(darkstar)

add_definitions(
    -DDEBUGLOGSEARCH
)

file(GLOB_RECURSE GENERATED_SOURCES CONFIGURE_DEPENDS *.cpp)

if(UNIX)
    set(resource "")
else()
    set(resource "../../win32/vcxproj/searchserver.rc")
endif()

add_executable(DSSearch-server
    ${GENERATED_SOURCES}
    ../common/blowfish.cpp
    ../common/md52.cpp
    ../common/showmsg.cpp
    ../common/sql.cpp
    ../common/taskmgr.cpp
    ../common/timer.cpp
    ../common/utils.cpp
    ${resource}
)

set_target_properties(DSSearch-server PROPERTIES OUTPUT_NAME DSSearch-server${spacer}${platform_suffix})

if(UNIX)
    target_include_directories(DSSearch-server PRIVATE
        ${MYSQLCLIENT_INCLUDE_DIRS}
    )

    target_link_libraries(DSSearch-server
        ${MYSQLCLIENT_LIBRARIES}
        ${ZMQ_LIBRARIES}
        ${CMAKE_THREAD_LIBS_INIT}
    )
else()
    target_include_directories(DSSearch-server PRIVATE
        ../common
        ../../win32/external
        ../../win32/external/mysql
    )
    target_link_libraries(DSSearch-server
        libmariadb${platform_suffix}
        WS2_32
    )
endif()
