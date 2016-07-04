#ifndef _CBASETYPES_H_
#define _CBASETYPES_H_

#include <stdint.h>

/*              +--------+-----------+--------+---------+
 *              | ILP32  |   LP64    |  ILP64 | (LL)P64 |
 * +------------+--------+-----------+--------+---------+
 * | ints       | 32-bit |   32-bit  | 64-bit |  32-bit |
 * | longs      | 32-bit |   64-bit  | 64-bit |  32-bit |
 * | long-longs | 64-bit |   64-bit  | 64-bit |  64-bit |
 * | pointers   | 32-bit |   64-bit  | 64-bit |  64-bit |
 * +------------+--------+-----------+--------+---------+
 * |    where   |   --   |   Tiger   |  Alpha | Windows |
 * |    used    |        |   Unix    |  Cray  |         |
 * |            |        | Sun & SGI |        |         |
 * +------------+--------+-----------+--------+---------+
 * Taken from http://developer.apple.com/macosx/64bit.html
 */
//////////////////////////////////////////////////////////////////////////
// basic include for all basics
// introduces types and global functions
//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
// setting some defines on platforms
//////////////////////////////////////////////////////////////////////////


#if (defined(__WIN32__) || defined(__WIN32) || defined(_WIN32) || defined(_WIN64) || defined(_MSC_VER) || defined(__BORLANDC__)) && !defined(WIN32)
#define WIN32
#endif

#if defined(__MINGW32__) && !defined(MINGW)
#define MINGW
#endif

#if (defined(__CYGWIN__) || defined(__CYGWIN32__)) && !defined(CYGWIN)
#define CYGWIN
#endif

#if !defined(__64BIT__) && (defined(__x86_64__) || defined(_WIN64))
#define __64BIT__
#endif

// debug mode
#if defined(_DEBUG) && !defined(DEBUG)
#define DEBUG
#endif

// debug function name
#ifndef __NETBSD__
#if __STDC_VERSION__ < 199901L
#	if __GNUC__ >= 2
#		define __func__ __FUNCTION__
#	else
#		define __func__ ""
#	endif
#endif
#endif

// disable attributed stuff on non-GNU
#if !defined(__GNUC__) && !defined(MINGW)
#  define  __attribute__(x)
#endif

// define a break macro for debugging.
#if defined(DEBUG)
#if defined(_MSC_VER)
#define DSP_DEBUG_BREAK_IF(_CONDITION_) if (_CONDITION_) {__debugbreak();}
#else
#include "assert.h"
#define DSP_DEBUG_BREAK_IF(_CONDITION_) assert(!(_CONDITION_));
#endif
#else
#define DSP_DEBUG_BREAK_IF(_CONDITION_)
#endif

//////////////////////////////////////////////////////////////////////////
// typedefs to compensate type size change from 32bit to 64bit
// MS implements LLP64 model, normal unix does LP64,
// only Silicon Graphics/Cray goes ILP64 so don't care (and don't support)
//////////////////////////////////////////////////////////////////////////

#include <limits.h>
// ILP64 isn't supported, so always 32 bits?
#ifndef UINT_MAX
#define UINT_MAX 0xffffffff
#endif

//////////////////////////////////////////////////////////////////////////
// Integers with guaranteed _exact_ size.
//////////////////////////////////////////////////////////////////////////

#define SIZEOF_LONG 4
#define SIZEOF_INT 4
#define HAVE_INT_8_16_32

typedef char				int8;
typedef short				int16;
typedef int					int32;

typedef signed char			sint8;
typedef signed short		sint16;
typedef signed int			sint32;

typedef unsigned char		uint8;
typedef unsigned short		uint16;
typedef unsigned int		uint32;

#undef UINT8_MIN
#undef UINT16_MIN
#undef UINT32_MIN
//--
#define UINT8_MIN	((uint8) 0)
#define UINT16_MIN	((uint16)0)
#define UINT32_MIN	((uint32)0)
//***************

#undef SINT8_MIN
#undef SINT16_MIN
#undef SINT32_MIN
//---
#define SINT8_MIN	((sint8) 0x80)
#define SINT16_MIN	((sint16)0x8000)
#define SINT32_MIN	((sint32)0x80000000)
//****************


#undef SINT8_MAX
#undef SINT16_MAX
#undef SINT32_MAX
//--
#define SINT8_MAX	((sint8) 0x7F)
#define SINT16_MAX	((sint16)0x7FFF)
#define SINT32_MAX	((sint32)0x7FFFFFFF)
//****************


//////////////////////////////////////////////////////////////////////////
// Integers with guaranteed _minimum_ size.
// These could be larger than you expect,
// they are designed for speed.
//////////////////////////////////////////////////////////////////////////
typedef          long int   ppint;
typedef          long int   ppint8;
typedef          long int   ppint16;
typedef          long int   ppint32;

typedef unsigned long int   ppuint;
typedef unsigned long int   ppuint8;
typedef unsigned long int   ppuint16;
typedef unsigned long int   ppuint32;

//////////////////////////////////////////////////////////////////////////
// integer with exact processor width (and best speed)
//////////////////////////////
#include <stddef.h> // size_t

#if defined(WIN32) && !defined(MINGW) // does not have a signed size_t
//////////////////////////////
#if defined(_WIN64)	// naive 64bit windows platform
typedef __int64			ssize_t;
#else
typedef int				ssize_t;
#endif
//////////////////////////////
#endif
//////////////////////////////


//////////////////////////////////////////////////////////////////////////
// portable 64-bit integers
//////////////////////////////////////////////////////////////////////////
#if defined(_MSC_VER) || defined(__BORLANDC__)
typedef __int64				int64;
typedef signed __int64		sint64;
typedef unsigned __int64	uint64;
#define LLCONST(a)			(a##i64)
#else
typedef long long			int64;
typedef signed long long	sint64;
typedef unsigned long long	uint64;
#define LLCONST(a)			(a##ll)
#endif

//////////////////////////////////////////////////////////////////////////
// pointer sized integers
//////////////////////////////////////////////////////////////////////////
#undef UINTPTR_MIN
#undef UINTPTR_MAX
#undef INTPTR_MIN
#undef INTPTR_MAX
#ifdef __64BIT__
typedef uint64 uintptr;
typedef int64 intptr;
#define UINTPTR_MIN UINT64_MIN
#define UINTPTR_MAX UINT64_MAX
#define INTPTR_MIN INT64_MIN;
#define INTPTR_MAX INT64_MAX;
#else
typedef uint32 uintptr;
typedef int32 intptr;
#define UINTPTR_MIN UINT32_MIN
#define UINTPTR_MAX UINT32_MAX
#endif

//////////////////////////////////////////////////////////////////////////
// some redefine of function redefines for some Compilers
//////////////////////////////////////////////////////////////////////////
#if (defined(_MSC_VER) && _MSC_VER < 1900) || defined(__BORLANDC__)
#define strcasecmp			stricmp
#define strncasecmp			strnicmp
#define strncmpi			strnicmp
#define snprintf			_snprintf
#if defined(_MSC_VER) && _MSC_VER < 1400
#define vsnprintf			_vsnprintf
#endif
#elif !defined(_MSC_VER)
#define strcmpi				strcasecmp
#define stricmp				strcasecmp
#define strncmpi			strncasecmp
#define strnicmp			strncasecmp
#endif
#if defined(_MSC_VER) && _MSC_VER > 1200
#define strtoull			_strtoui64
#endif


// keyword replacement in windows for MSVC versions lower than 11 (2012)
#ifdef _WIN32
#if defined(_MSC_VER) && _MSC_VER < 1700
#define inline __inline
#endif
#endif

///////////////////////////////
// for those still not building c++
#ifndef __cplusplus
//////////////////////////////

// boolean types for C
typedef char bool;
#define false	(1==0)
#define true	(1==1)

//////////////////////////////
#endif // not cplusplus
//////////////////////////////

#ifdef __cplusplus
	#include <algorithm>
#endif

#define dsp_max(a,b) (((a) > (b)) ? (a) : (b))
#define dsp_min(a,b) (((a) < (b)) ? (a) : (b))
#define dsp_cap(a, min, max) ((a >= max) ? max : (a <= min) ? min : a)	// caps values to min/max

//////////////////////////////////////////////////////////////////////////
// should not happen
#ifndef NULL
#define NULL (void *)0
#endif

//////////////////////////////////////////////////////////////////////////
// number of bits in a byte
#ifndef NBBY
#define	NBBY 8
#endif

//////////////////////////////////////////////////////////////////////////
// path separator

#if defined(WIN32)
	#define PATHSEP '\\'
#elif defined(__APPLE__)
	#define PATHSEP ':'
#else
	#define PATHSEP '/'
#endif


//////////////////////////////////////////////////////////////////////////
// Assert

#if ! defined(Assert)
	#if defined(RELEASE)
		#define Assert(EX)
	#else
		#include <assert.h>
		#if !defined(DEFCPP) && defined(WIN32) && !defined(MINGW)
			#include <crtdbg.h>
		#endif
		#define Assert(EX) assert(EX)
	#endif
#endif /* ! defined(Assert) */


//////////////////////////////////////////////////////////////////////////
// Has to be unsigned to avoid problems in some systems
// Problems arise when these functions expect an argument in the range [0,256[ and are fed a signed char.
#include <ctype.h>
#define ISALNUM(c) (isalnum((unsigned char)(c)))
#define ISALPHA(c) (isalpha((unsigned char)(c)))
#define ISCNTRL(c) (iscntrl((unsigned char)(c)))
#define ISDIGIT(c) (isdigit((unsigned char)(c)))
#define ISGRAPH(c) (isgraph((unsigned char)(c)))
#define ISLOWER(c) (islower((unsigned char)(c)))
#define ISPRINT(c) (isprint((unsigned char)(c)))
#define ISPUNCT(c) (ispunct((unsigned char)(c)))
#define ISSPACE(c) (isspace((unsigned char)(c)))
#define ISUPPER(c) (isupper((unsigned char)(c)))
#define ISXDIGIT(c) (isxdigit((unsigned char)(c)))
#define TOASCII(c) (toascii((unsigned char)(c)))
#define TOLOWER(c) (tolower((unsigned char)(c)))
#define TOUPPER(c) (toupper((unsigned char)(c)))

//////////////////////////////////////////////////////////////////////////
// length of a static array
#define ARRAYLENGTH(A) ( sizeof(A)/sizeof((A)[0]) )

//////////////////////////////////////////////////////////////////////////
// Make sure va_copy exists
#include <stdarg.h> // va_list, va_copy(?)
#if !defined(va_copy)
	#if defined(__va_copy)
		#define va_copy __va_copy
	#else
		#define va_copy(dst, src) ((void) memcpy(&(dst), &(src), sizeof(va_list)))
	#endif
#endif

#include <chrono>

using namespace std::chrono_literals;
using server_clock = std::chrono::steady_clock;
using time_point = server_clock::time_point;
using duration = server_clock::duration;

#endif /* _CBASETYPES_H_ */
