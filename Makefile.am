## Set automake options
AUTOMAKE_OPTIONS=foreign

## Gather sourcelist
include sources.am

## Set up all of our dependency flags
SRC_ALL                 = $(SRC_DARKSTAR)
CFLAGS_ALL              = $(DARKSTAR_CFLAGS)
CPPFLAGS_ALL            = $(DARKSTAR_CPPFLAGS)
CXXFLAGS_ALL            = $(DARKSTAR_CXXFLAGS)
LIBS_ALL                = $(DARKSTAR_LIBS)
LDFLAGS_ALL             = $(DARKSTAR_LDFLAGS)
CXX                     = g++ -std=c++1y

CFLAGS_ALL              += $(LUA_CFLAGS)
CFLAGS_ALL              += $(MYSQL_CFLAGS)

LIBS_ALL                += $(LUA_LIBS)
LIBS_ALL                += $(MYSQL_LDFLAGS)
LIBS_ALL                += -lzmq

## Add Architecture-specific stuff
if DARKSTAR_ARCH_LINUX
LIBS_ALL                += -ldl
endif

if DARKSTAR_ARCH_SOLARIS
LIBS_ALL                += -lsocket -lnsl -ldl
endif

if DARKSTAR_ARCH_FREEBSD
CPPFLAGS_ALL            += -D__FREEBSD__
endif

if DARKSTAR_ARCH_NETBSD
CPPFLAGS_ALL            += -D__NETBSD__
endif

if DARKSTAR_ARCH_WIN32
CPPFLAGS_ALL            += -DFD_SETSIZE=4096 -DCYGWIN
endif

## Targets
bin_PROGRAMS          = dsgame dsconnect dssearch

dsgame_SOURCES        = $(SRC_ALL) $(SRC_MAP)
dsgame_CXXFLAGS       = $(CFLAGS_ALL) $(CXXFLAGS_ALL)
dsgame_CPPFLAGS       = $(CPPFLAGS_ALL) -DdsUDPSERV
dsgame_CFLAGS         = $(CFLAGS_ALL)
dsgame_LDFLAGS        = $(LDFLAGS_ALL)
dsgame_LDADD          = $(LIBS_ALL)

dsconnect_SOURCES     = $(SRC_ALL) $(SRC_LOGIN)
dsconnect_CXXFLAGS    = $(CFLAGS_ALL) $(CXXFLAGS_ALL)
dsconnect_CPPFLAGS    = $(CPPFLAGS_ALL) -DdsTCPSERV
dsconnect_CFLAGS      = $(CFLAGS_ALL)
dsconnect_LDFLAGS     = $(LDFLAGS_ALL)
dsconnect_LDADD       = $(LIBS_ALL)

dssearch_SOURCES     = $(SRC_SEARCH_COMMON) $(SRC_SEARCH)
dssearch_CXXFLAGS    = $(CFLAGS_ALL) $(CXXFLAGS_ALL)
dssearch_CPPFLAGS    = $(CPPFLAGS_ALL)
dssearch_CFLAGS      = $(CFLAGS_ALL)
dssearch_LDFLAGS     = $(LDFLAGS_ALL)
dssearch_LDADD       = $(LIBS_ALL)
