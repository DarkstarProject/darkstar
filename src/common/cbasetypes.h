#ifndef _CBASETYPES_H_
#define _CBASETYPES_H_

#include <cstdint>
#include <climits>
#include <cctype>
#include <algorithm>

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

// ILP64 isn't supported, so always 32 bits?
#ifndef UINT_MAX
#define UINT_MAX 0xffffffff
#endif

//////////////////////////////////////////////////////////////////////////
// Integers with guaranteed _exact_ size.
//////////////////////////////////////////////////////////////////////////
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

//////////////////////////////////////////////////////////////////////////
// pointer sized integers
//////////////////////////////////////////////////////////////////////////
#undef UINTPTR_MIN
#undef UINTPTR_MAX
#undef INTPTR_MIN
#undef INTPTR_MAX
#ifdef __64BIT__
typedef std::uint64_t uintptr;
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

#include <chrono>

using namespace std::literals::chrono_literals;
using server_clock = std::chrono::steady_clock;
using time_point = server_clock::time_point;
using duration = server_clock::duration;

#endif /* _CBASETYPES_H_ */
