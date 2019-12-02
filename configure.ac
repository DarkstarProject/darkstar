### Package information
AC_PREREQ(2.61)
AC_INIT(ProjectTopaz,m4_esyscmd_s([git rev-parse HEAD]))
AC_CONFIG_SRCDIR([src/common/cbasetypes.h])
AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE(Topaz,git)

### Checks for compiler and core header files
AC_PROG_CC
AC_PROG_CXX
AC_PROG_CXXCPP
AC_LANG([C++])
AC_HEADER_STDC

### Add flags without overriding user-defined flags
TOPAZ_CXXFLAGS="$CXXFLAGS -pipe -ffast-math -Wno-sign-compare"
TOPAZ_CPPFLAGS="$CPPFLAGS -I../common"

### Big endian test
AC_C_BIGENDIAN(
     [AC_MSG_ERROR([[bigendian is not supported... stopping]])],
     ,
     [AC_MSG_WARN([[unable to determine endianess, only little endian is supported]])]
)

### pkg-config checks
PKG_CHECK_MODULES(LUA, luajit, , [PKG_CHECK_MODULES(LUA, lua5.1 >= 0.25)])
PKG_CHECK_MODULES(ZMQ, libzmq)
AC_SUBST(LUA_CFLAGS)
AC_SUBST(LUA_LIBS)

### MySQL check
m4_include([m4/ax_lib_mysql.m4])
AX_LIB_MYSQL()

### Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_ASSERT
AC_HEADER_TIME

### Detect target platform
case "$host" in
        *-*-linux*)
                topaz_arch_linux=true
                ;;
        *-*-solaris*)
                topaz_arch_solaris=true
                ;;
        *-*-freebsd* | *-*-netbsd*)
                topaz_arch_freebsd=true
                ;;
        *-*-cygwin* | *-*-mingw32*)
                topaz_arch_win32=true
                ;;
        *-*-darwin*)
                topaz_arch_osx=true
                ;;
        *)
                AC_MSG_ERROR([*** Invalid host])
                ;;
esac

### Select Memory Manager
AC_ARG_ENABLE(
   [manager],
   AC_HELP_STRING(
        [--enable-manager=ARG],
        [memory managers: no, builtin, memwatch, dmalloc, gcollect, bcheck ( default to builtin) ]
   ),
   [
        enable_manager="$enableval"
        case $enableval in
                "no");;
                "builtin");;
                "memwatch");;
                "dmalloc");;
                "gcollect");;
                "bcheck");;
                *) AC_MSG_ERROR([[unknown memory manager '$enableval' ... stopping]]);;
        esac
   ],
   [enable_manager="builtin"]
)

### Enable debug breakpoints
AC_ARG_ENABLE(
   [debug],
   AC_HELP_STRING(
        [--enable-debug@<:@=ARG@:>@],
        [
                Compiles extra debug code. (disabled by default)
                (abailable options: yes, no, gdb)
        ]
   ),
   [
     enable_debug="$enableval"
     case $enableval in
             "no");;
             "yes");;
             "gdb");;
             *) AC_MSG_ERROR([[invalid argument --enable-debug=$enableval... stopping]]);;
     esac
   ],
   [enable_debug="no"]
)

### Use RDTSC as Tick Source
AC_ARG_ENABLE(
   [rdtsc],
   AC_HELP_STRING(
        [--enable-rdtsc],
        [
                Uses rdtsc as timing source (disabled by default)
                Enable it when you have timing issues.

                (For example: in conjunction with XEN or Other Virtualization mechanisms)

                Note:
                        Please ensure that you've disabled dynamic CPU-Frequencys, such as power saving options.
                        (On the most modern Dedicated Servers cpufreq is preconfigured, see your distribution's manual
                         how to disable it)
        ]
  ),
  [
     enable_rdtsc=1
  ],
  [enable_rdtsc=0]
)

AC_MSG_CHECKING([whether $CXX supports -Wno-unused-parameter])
OLD_TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS"
TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS -Wno-unused-parameter"
AC_COMPILE_IFELSE(
        [int foo;],
        [AC_MSG_RESULT([yes])],
        [
             AC_MSG_RESULT([no])
             TOPAZ_CXXFLAGS="$OLD_TOPAZ_CXXFLAGS"
        ]
)

AC_MSG_CHECKING([whether $CXX supports -Wno-pointer-sign])
OLD_TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS"
TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS -Wno-pointer-sign"
AC_COMPILE_IFELSE(
        [int foo;],
        [AC_MSG_RESULT([yes])],
        [
            AC_MSG_RESULT([no])
            TOPAZ_CXXFLAGS="$OLD_TOPAZ_CXXFLAGS"
        ]
)

AC_MSG_CHECKING([whether $CXX supports -Wno-switch])
OLD_TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS"
TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS -Wno-switch"
AC_COMPILE_IFELSE(
        [int foo;],
        [AC_MSG_RESULT([yes])],
        [
             AC_MSG_RESULT([no])
             TOPAZ_CXXFLAGS="$OLD_TOPAZ_CXXFLAGS"
        ]
)

### Checks for libraries and header files

AC_CHECK_FUNC([setrlimit],[TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS -DHAVE_SETRLIMIT"])

### Memory manager
case $enable_manager in
        "no")
             TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS -DNO_MEMGR"
             ;;
        "builtin")
             #enabled by default
             ;;
        "memwatch")
            TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS -DMEMWATCH"
            AC_CHECK_HEADER([memwatch.h], , [AC_MSG_ERROR([memwatch header not found...stopping])])
            ;;
        "dmalloc")
            TOPAZ_CXXFLAGS "$TOPAZ_CXXFLAGS -DDMALLOC -DDMALLOC_FUNC_CHECK"
            TOPAZ_LIBS="$TOPAZ_LIBS -ldmalloc"
            AC_CHECK_HEADER([dmalloc.h], , AC_MSG_ERROR([dmalloc header not found...stopping]))
            ;;
        "gcollect")
            TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS -DGCOLLECT"
            TOPAZ_LIBS="$TOPAZ_LIBS -lgc"
            AC_CHECK_HEADER([gc.h], , [AC_MSG_ERROR([gcollect header not found... stopping])])
            ;;
        "bcheck")
            TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS -DBCHECK"
            ;;
esac

### Debug
case $enable_debug in
        "no")
             #default value
             TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS -Wno-unused -Wno-parentheses"
             ;;
        "yes")
             TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS -g -DDEBUG"
             ;;
        "gdb")
             TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS -ggdb -DDEBUG"
             ;;
esac

### RDTSC
case $enable_rdtsc in
        0)
           #default value
           ;;
        1)
           TOPAZ_CXXFLAGS="$TOPAZ_CXXFLAGS -DENABLE_RDTSC"
           ;;
esac

###Math library
AC_CHECK_LIB([m], [sqrt], [], [AC_MSG_ERROR([math library not found... stopping])])

### clock_gettime
AC_CHECK_LIB([rt], [clock_gettime])

### Linux specifics
if test "$topaz_arch_linux"
then
        AC_MSG_RESULT(Building Linux targets)
        AC_DEFINE(TOPAZ_ARCH_LINUX,1,Compile code for a linux-based target)
fi

### Solaris Specifics
if test "$topaz_arch_solaris"
then
        AC_MSG_RESULT(Building Solaris targets)
        AC_DEFINE(TOPAZ_ARCH_SOLARIS,1,Compile code for a Solaris target)
fi

### FreeBSD Specifics
if test "$topaz_arch_freebsd"
then
        AC_MSG_RESULT(Building FreeBSD targets)
        AC_DEFINE(TOPAZ_ARCH_FREEBSD,1,Compile code for a FreeBSD target)
fi

### NetBSD Specifics
if test "$topaz_arch_netbsd"
then
        AC_MSG_RESULT(Building NetBSD targets)
        AC_DEFINE(TOPAZ_ARCH_NETBSD,1,Compile code for a NetBSD target)
fi

### Win32 Specifics
if test "$topaz_arch_win32"
then
        AC_MSG_RESULT(Building Win32 targets)
        AC_DEFINE(TOPAZ_ARCH_WIN32,1,Compile code for a windows target)
        DLLEXT=".dll"
fi

### OSX Specifics
if test "$topaz_arch_osx"
then
        AC_MSG_RESULT(Building OSX targets)
        AC_DEFINE(TOPAZ_ARCH_OSX,1,Compile code for an OSX target)
fi

AC_SUBST([DLLEXT])

AM_CONDITIONAL(TOPAZ_ARCH_LINUX,test "$topaz_arch_linux")
AM_CONDITIONAL(TOPAZ_ARCH_SOLARIS,test "$topaz_arch_solaris")
AM_CONDITIONAL(TOPAZ_ARCH_FREEBSD,test "$topaz_arch_freebsd")
AM_CONDITIONAL(TOPAZ_ARCH_NETBSD,test "$topaz_arch_netbsd")
AM_CONDITIONAL(TOPAZ_ARCH_WIN32,test "$topaz_arch_win32")
AM_CONDITIONAL(TOPAZ_ARCH_OSX,test "$topaz_arch_osx")

AC_CONFIG_HEADER([src/common/config.h])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
