## Set automake options
AUTOMAKE_OPTIONS=foreign

## Gather sourcelist
include sources.am

## Set up all of our dependency flags
SRC_ALL                 = $(SRC_TOPAZ)
CFLAGS_ALL              = $(TOPAZ_CFLAGS) -fsigned-char
CPPFLAGS_ALL            = $(TOPAZ_CPPFLAGS) -fsigned-char -DFMT_HEADER_ONLY
CXXFLAGS_ALL            = $(TOPAZ_CXXFLAGS) -fsigned-char
LIBS_ALL                = $(TOPAZ_LIBS)
LDFLAGS_ALL             = $(TOPAZ_LDFLAGS)
CXX                     = g++ -std=c++17

CFLAGS_ALL              += $(LUA_CFLAGS)
CFLAGS_ALL              += $(MYSQL_CFLAGS)

LIBS_ALL                += $(LUA_LIBS)
LIBS_ALL                += $(MYSQL_LDFLAGS)
LIBS_ALL                += -lzmq

## Add Architecture-specific stuff
if TOPAZ_ARCH_LINUX
LIBS_ALL                += -ldl
endif

if TOPAZ_ARCH_SOLARIS
LIBS_ALL                += -lsocket -lnsl -ldl
endif

if TOPAZ_ARCH_FREEBSD
CPPFLAGS_ALL            += -D__FREEBSD__
endif

if TOPAZ_ARCH_NETBSD
CPPFLAGS_ALL            += -D__NETBSD__
endif

if TOPAZ_ARCH_WIN32
CPPFLAGS_ALL            += -DFD_SETSIZE=4096 -DCYGWIN
endif

if TOPAZ_ARCH_OSX
LDFLAGS_ALL             += -pagezero_size 10000 -image_base 100000000
endif

## Targets
bin_PROGRAMS          = tpzgame tpzconnect tpzsearch

tpzgame_SOURCES        = $(SRC_ALL) $(SRC_MAP)
tpzgame_CXXFLAGS       = $(CFLAGS_ALL) $(CXXFLAGS_ALL)
tpzgame_CPPFLAGS       = $(CPPFLAGS_ALL)
tpzgame_CFLAGS         = $(CFLAGS_ALL)
tpzgame_LDFLAGS        = $(LDFLAGS_ALL)
tpzgame_LDADD          = $(LIBS_ALL)

tpzconnect_SOURCES     = $(SRC_ALL) $(SRC_LOGIN)
tpzconnect_CXXFLAGS    = $(CFLAGS_ALL) $(CXXFLAGS_ALL)
tpzconnect_CPPFLAGS    = $(CPPFLAGS_ALL)
tpzconnect_CFLAGS      = $(CFLAGS_ALL)
tpzconnect_LDFLAGS     = $(LDFLAGS_ALL)
tpzconnect_LDADD       = $(LIBS_ALL)

tpzsearch_SOURCES     = $(SRC_SEARCH_COMMON) $(SRC_SEARCH)
tpzsearch_CXXFLAGS    = $(CFLAGS_ALL) $(CXXFLAGS_ALL)
tpzsearch_CPPFLAGS    = $(CPPFLAGS_ALL)
tpzsearch_CFLAGS      = $(CFLAGS_ALL)
tpzsearch_LDFLAGS     = $(LDFLAGS_ALL)
tpzsearch_LDADD       = $(LIBS_ALL)
