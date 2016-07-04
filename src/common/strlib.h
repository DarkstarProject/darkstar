// Copyright (c) darkstar teams

#ifndef _STRLIB_H_
#define _STRLIB_H_

#ifndef _CBASETYPES_H_
	#include "../common/cbasetypes.h"
#endif
#include <stdarg.h>
#include <cstring>

char* jstrescape (char* pt);
char* jstrescapecpy (char* pt, const char* spt);
int jmemescapecpy (char* pt, const char* spt, int size);

int remove_control_chars(char* str);
char* trim(char* str);
char* normalize_name(char* str,const char* delims);
const char *stristr(const char *haystack, const char *needle);

#ifdef WIN32
#define HAVE_STRTOK_R
#define strtok_r(s,delim,save_ptr) _strtok_r((s),(delim),(save_ptr))
char* _strtok_r(char* s1, const char* s2, char** lasts);
#endif

#if !(defined(WIN32) && defined(_MSC_VER) && _MSC_VER >= 1400) && !defined(CYGWIN)
size_t strnlen (const char* string, size_t maxlen);
#endif

#if defined(WIN32) && defined(_MSC_VER) && _MSC_VER <= 1200
unsigned long long strtoull(const char* str, char** endptr, int base);
#endif

#if defined(WIN32)
#define strcmpi _strcmpi
#endif

int e_mail_check(char* email);
int config_switch(const char* str);

/// strncpy that always nul-terminates the string
char* safestrncpy(char* dst, const char* src, size_t n);

/// doesn't crash on null pointer
size_t safestrnlen(const char* string, size_t maxlen);

/// Works like snprintf, but always nul-terminates the buffer.
/// Returns the size of the string (without nul-terminator)
/// or -1 if the buffer is too small.
int safesnprintf(char* buf, size_t sz, const char* fmt, ...);

/// Returns the line of the target position in the string.
/// Lines start at 1.
int strline(const char* str, size_t pos);

/// Produces the hexadecimal representation of the given input.
/// The output buffer must be at least count*2+1 in size.
/// Returns true on success, false on failure.
bool bin2hex(char* output, unsigned char* input, size_t count);


/// Bitfield determining the behaviour of sv_parse and sv_split.
typedef enum e_svopt
{
	// default: no escapes and no line terminator
	SV_NOESCAPE_NOTERMINATE = 0,
	// Escapes according to the C compiler.
	SV_ESCAPE_C = 1,
	// Line terminators
	SV_TERMINATE_LF = 2,
	SV_TERMINATE_CRLF = 4,
	SV_TERMINATE_CR = 8,
	// If sv_split keeps the end of line terminator, instead of replacing with '\0'
	SV_KEEP_TERMINATOR = 16
} e_svopt;

/// Other escape sequences supported by the C compiler.
#define SV_ESCAPE_C_SUPPORTED "abtnvfr\?\"'\\"

/// Parses a delim-separated string.
/// Starts parsing at startoff and fills the pos array with position pairs.
/// out_pos[0] and out_pos[1] are the start and end of line.
/// Other position pairs are the start and end of fields.
/// Returns the number of fields found or -1 if an error occurs.
int sv_parse(const char* str, int len, int startoff, char delim, int* out_pos, int npos, enum e_svopt opt);

/// Splits a delim-separated string.
/// WARNING: this function modifies the input string
/// Starts splitting at startoff and fills the out_fields array.
/// out_fields[0] is the start of the next line.
/// Other entries are the start of fields (nul-teminated).
/// Returns the number of fields found or -1 if an error occurs.
int sv_split(char* str, int len, int startoff, char delim, char** out_fields, int nfields, enum e_svopt opt);

/// Escapes src to out_dest according to the format of the C compiler.
/// Returns the length of the escaped string.
/// out_dest should be len*4+1 in size.
size_t sv_escape_c(char* out_dest, const char* src, size_t len, const char* escapes);

/// Unescapes src to out_dest according to the format of the C compiler.
/// Returns the length of the unescaped string.
/// out_dest should be len+1 in size and can be the same buffer as src.
size_t sv_unescape_c(char* out_dest, const char* src, size_t len);

/// Skips a C escape sequence (starting with '\\').
const char* skip_escaped_c(const char* p);

/// Opens and parses a file containing delim-separated columns, feeding them to the specified callback function row by row.
/// Tracks the progress of the operation (current line number, number of successfully processed rows).
/// Returns 'true' if it was able to process the specified file, or 'false' if it could not be read.
bool sv_readdb(const char* directory, const char* filename, char delim, int mincols, int maxcols, int maxrows, bool (*parseproc)(char* fields[], int columns, int current));


/// StringBuf - dynamic string
struct StringBuf
{
	char *buf_;
	char *ptr_;
	unsigned int max_;
};
typedef struct StringBuf StringBuf;

StringBuf* StringBuf_Malloc(void);
void StringBuf_Init(StringBuf* self);
int StringBuf_Printf(StringBuf* self, const char* fmt, ...);
int StringBuf_Vprintf(StringBuf* self, const char* fmt, va_list args);
int StringBuf_Append(StringBuf* self, const StringBuf *sbuf);
int StringBuf_AppendStr(StringBuf* self, const char* str);
int StringBuf_Length(StringBuf* self);
char* StringBuf_Value(StringBuf* self);
void StringBuf_Clear(StringBuf* self);
void StringBuf_Destroy(StringBuf* self);
void StringBuf_Free(StringBuf* self);

#endif /* _STRLIB_H_ */
