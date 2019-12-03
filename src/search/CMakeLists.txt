cmake_minimum_required(VERSION 3.9)
project(topaz)

add_definitions(
    -DDEBUGLOGSEARCH
)

file(GLOB_RECURSE GENERATED_SOURCES CONFIGURE_DEPENDS *.cpp)

if(UNIX)
    set(resource "")
else()
    set(resource "../../win32/vcxproj/searchserver.rc")
endif()

add_executable(topaz-search
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

set_target_properties(topaz-search PROPERTIES OUTPUT_NAME topaz-search${spacer}${platform_suffix})

if(UNIX)
    target_include_directories(topaz-search PRIVATE
        ${MYSQLCLIENT_INCLUDE_DIRS}
    )

    target_link_libraries(topaz-search
        ${MYSQLCLIENT_LIBRARIES}
        ${ZMQ_LIBRARIES}
        ${CMAKE_THREAD_LIBS_INIT}
    )
else()
    target_include_directories(topaz-search PRIVATE
        ../common
        ../../win32/external
        ../../win32/external/mysql
    )
    target_link_libraries(topaz-search
        libmariadb${platform_suffix}
        WS2_32
    )
endif()
