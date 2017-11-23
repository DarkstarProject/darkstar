#ifndef _CBASETYPES_H_
#define _CBASETYPES_H_

#include <cstdint>
#include <climits>
#include <cctype>
#include <cstddef>
#include <algorithm>

// debug mode
#if defined(_DEBUG) && !defined(DEBUG)
#define DEBUG
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
// Integers with guaranteed _exact_ size.
//////////////////////////////////////////////////////////////////////////
//typedef char				std::int8_t;

typedef signed char			sint8;
typedef signed short		sint16;
typedef signed int			sint32;

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
