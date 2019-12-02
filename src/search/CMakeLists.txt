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

add_executable(TPZSearch-server
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

set_target_properties(TPZSearch-server PROPERTIES OUTPUT_NAME TPZSearch-server${spacer}${platform_suffix})

if(UNIX)
    target_include_directories(TPZSearch-server PRIVATE
        ${MYSQLCLIENT_INCLUDE_DIRS}
    )

    target_link_libraries(TPZSearch-server
        ${MYSQLCLIENT_LIBRARIES}
        ${ZMQ_LIBRARIES}
        ${CMAKE_THREAD_LIBS_INIT}
    )
else()
    target_include_directories(TPZSearch-server PRIVATE
        ../common
        ../../win32/external
        ../../win32/external/mysql
    )
    target_link_libraries(TPZSearch-server
        libmariadb${platform_suffix}
        WS2_32
    )
endif()
