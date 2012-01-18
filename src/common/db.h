//Copyright (c) 2010-2012 Darkstar Dev Teams

#ifndef _DB_H
#define _DB_H

#include "../common/cbasetypes.h"
#include <stdarg.h>

///////////////////////////////
// Link DB System - From jAthena
struct linkdb_node {
	struct linkdb_node *next;
	struct linkdb_node *prev;
	void               *key;
	void               *data;
};

typedef void (*LinkDBFunc)(void* key, void* data, va_list args);

void  linkdb_insert ( struct linkdb_node** head, void *key, void* data); // 重複を考慮しない
void  linkdb_replace( struct linkdb_node** head, void *key, void* data); // 重複を考慮する
void* linkdb_search ( struct linkdb_node** head, void *key);
void* linkdb_erase  ( struct linkdb_node** head, void *key);
void  linkdb_final  ( struct linkdb_node** head );
void  linkdb_foreach( struct linkdb_node** head, LinkDBFunc func, ...  );
/// Finds an entry in an array.
/// ex: ARR_FIND(0, size, i, list[i] == target);
///
/// @param __start   Starting index (ex: 0)
/// @param __end     End index (ex: size of the array)
/// @param __var     Index variable
/// @param __cmp     Expression that returns true when the target entry is found
#define ARR_FIND(__start, __end, __var, __cmp) \
	do{ \
		for( (__var) = (__start); (__var) < (__end); ++(__var) ) \
			if( __cmp ) \
				break; \
	}while(0) 

/// Moves an entry of the array.
/// Use ARR_MOVERIGHT/ARR_MOVELEFT if __from and __to are direct numbers.
/// ex: ARR_MOVE(i, 0, list, int);// move index i to index 0
///
///
/// @param __from   Initial index of the entry
/// @param __to     Target index of the entry
/// @param __arr    Array
/// @param __type   Type of entry
#define ARR_MOVE(__from, __to, __arr, __type) \
	do{ \
		if( (__from) != (__to) ) \
		{ \
			__type __backup__; \
			memmove(&__backup__, (__arr)+(__from), sizeof(__type)); \
			if( (__from) < (__to) ) \
				memmove((__arr)+(__from), (__arr)+(__from)+1, ((__to)-(__from))*sizeof(__type)); \
			else if( (__from) > (__to) ) \
				memmove((__arr)+(__to)+1, (__arr)+(__to), ((__from)-(__to))*sizeof(__type)); \
			memmove((__arr)+(__to), &__backup__, sizeof(__type)); \
		} \
	}while(0)



/// Moves an entry of the array to the right.
/// ex: ARR_MOVERIGHT(1, 4, list, int);// move index 1 to index 4
///
/// @param __from   Initial index of the entry
/// @param __to     Target index of the entry
/// @param __arr    Array
/// @param __type   Type of entry
#define ARR_MOVERIGHT(__from, __to, __arr, __type) \
	do{ \
		__type __backup__; \
		memmove(&__backup__, (__arr)+(__from), sizeof(__type)); \
		memmove((__arr)+(__from), (__arr)+(__from)+1, ((__to)-(__from))*sizeof(__type)); \
		memmove((__arr)+(__to), &__backup__, sizeof(__type)); \
	}while(0)



/// Moves an entry of the array to the left.
/// ex: ARR_MOVELEFT(3, 0, list, int);// move index 3 to index 0
///
/// @param __from   Initial index of the entry
/// @param __end    Target index of the entry
/// @param __arr    Array
/// @param __type   Type of entry
#define ARR_MOVELEFT(__from, __to, __arr, __type) \
	do{ \
		__type __backup__; \
		memmove(&__backup__, (__arr)+(__from), sizeof(__type)); \
		memmove((__arr)+(__to)+1, (__arr)+(__to), ((__from)-(__to))*sizeof(__type)); \
		memmove((__arr)+(__to), &__backup__, sizeof(__type)); \
	}while(0)



/////////////////////////////////////////////////////////////////////
// Vector library based on defines. (dynamic array)
// uses aMalloc, aRealloc, aFree



/// Declares an anonymous vector struct.
///
/// @param __type Type of data
#define VECTOR_DECL(__type) \
	struct { \
		size_t _max_; \
		size_t _len_; \
		__type* _data_; \
	}



/// Declares a named vector struct.
///
/// @param __name Structure name
/// @param __type Type of data
#define VECTOR_STRUCT_DECL(__name,__type) \
	struct __name { \
		size_t _max_; \
		size_t _len_; \
		__type* _data_; \
	}



/// Declares and initializes an anonymous vector variable.
///
/// @param __type Type of data
/// @param __var Variable name
#define VECTOR_VAR(__type,__var) \
	VECTOR_DECL(__type) __var = {0,0,NULL}



/// Declares and initializes a named vector variable.
///
/// @param __name Structure name
/// @param __var Variable name
#define VECTOR_STRUCT_VAR(__name,__var) \
	struct __name __var = {0,0,NULL}



/// Initializes a vector.
///
/// @param __vec Vector
#define VECTOR_INIT(__vec) \
	memset(&(__vec), 0, sizeof(__vec))



/// Returns the internal array of values.
///
/// @param __vec Vector
/// @return Array of values
#define VECTOR_DATA(__vec) \
	( (__vec)._data_ )



/// Returns the length of the vector.
///
/// @param __vec Vector
/// @return Length
#define VECTOR_LENGTH(__vec) \
	( (__vec)._len_ )



/// Returns the capacity of the vector.
///
/// @param __vec Vector
/// @return Capacity
#define VECTOR_CAPACITY(__vec) \
	( (__vec)._max_ )



/// Returns the value at the target index.
/// Assumes the index exists.
///
/// @param __vec Vector
/// @param __idx Index
/// @return Value
#define VECTOR_INDEX(__vec,__idx) \
	( VECTOR_DATA(__vec)[__idx] )



/// Returns the first value of the vector.
/// Assumes the array is not empty.
///
/// @param __vec Vector
/// @return First value
#define VECTOR_FIRST(__vec) \
	( VECTOR_INDEX(__vec,0) )



/// Returns the last value of the vector.
/// Assumes the array is not empty.
///
/// @param __vec Vector
/// @return Last value
#define VECTOR_LAST(__vec) \
	( VECTOR_INDEX(__vec,VECTOR_LENGTH(__vec)-1) )



/// Resizes the vector.
/// Excess values are discarded, new positions are zeroed.
///
/// @param __vec Vector
/// @param __n Size
#define VECTOR_RESIZE(__type,__vec,__n) \
	do{ \
		if( (__n) > VECTOR_CAPACITY(__vec) ) \
		{ /* increase size */ \
			if( VECTOR_CAPACITY(__vec) == 0 ) VECTOR_DATA(__vec) = (__type*)aMalloc((__n)*sizeof(VECTOR_FIRST(__vec))); /* allocate new */ \
			else VECTOR_DATA(__vec) = (__type*)aRealloc(VECTOR_DATA(__vec),(__n)*sizeof(VECTOR_FIRST(__vec))); /* reallocate */ \
			memset(VECTOR_DATA(__vec)+VECTOR_LENGTH(__vec), 0, (VECTOR_CAPACITY(__vec)-VECTOR_LENGTH(__vec))*sizeof(VECTOR_FIRST(__vec))); /* clear new data */ \
			VECTOR_CAPACITY(__vec) = (__n); /* update capacity */ \
		} \
		else if( (__n) == 0 && VECTOR_CAPACITY(__vec) ) \
		{ /* clear vector */ \
			aFree(VECTOR_DATA(__vec)); VECTOR_DATA(__vec) = NULL; /* free data */ \
			VECTOR_CAPACITY(__vec) = 0; /* clear capacity */ \
			VECTOR_LENGTH(__vec) = 0; /* clear length */ \
		} \
		else if( (__n) < VECTOR_CAPACITY(__vec) ) \
		{ /* reduce size */ \
			VECTOR_DATA(__vec) = (__type*)aRealloc(VECTOR_DATA(__vec),(__n)*sizeof(VECTOR_FIRST(__vec))); /* reallocate */ \
			VECTOR_CAPACITY(__vec) = (__n); /* update capacity */ \
			if( VECTOR_LENGTH(__vec) > (__n) ) VECTOR_LENGTH(__vec) = (__n); /* update length */ \
		} \
	}while(0)



/// Ensures that the array has the target number of empty positions.
/// Increases the capacity in multiples of __step.
///
/// @param __vec Vector
/// @param __n Empty positions
/// @param __step Increase
#define VECTOR_ENSURE(__type,__vec,__n,__step) \
	do{ \
		size_t _empty_ = VECTOR_CAPACITY(__vec)-VECTOR_LENGTH(__vec); \
		while( (__n) > _empty_ ) _empty_ += (__step); \
		if( _empty_ != VECTOR_CAPACITY(__vec)-VECTOR_LENGTH(__vec) ) VECTOR_RESIZE(__type,__vec,_empty_+VECTOR_LENGTH(__vec)); \
	}while(0)



/// Inserts a zeroed value in the target index.
/// Assumes the index is valid and there is enough capacity.
///
/// @param __vec Vector
/// @param __idx Index
#define VECTOR_INSERTZEROED(__vec,__idx) \
	do{ \
		if( (__idx) < VECTOR_LENGTH(__vec) ) /* move data */ \
			memmove(&VECTOR_INDEX(__vec,(__idx)+1),&VECTOR_INDEX(__vec,__idx),(VECTOR_LENGTH(__vec)-(__idx))*sizeof(VECTOR_FIRST(__vec))); \
		memset(&VECTOR_INDEX(__vec,__idx), 0, sizeof(VECTOR_INDEX(__vec,__idx))); /* set zeroed value */ \
		++VECTOR_LENGTH(__vec); /* increase length */ \
	}while(0)



/// Inserts a value in the target index. (using the '=' operator)
/// Assumes the index is valid and there is enough capacity.
///
/// @param __vec Vector
/// @param __idx Index
/// @param __val Value
#define VECTOR_INSERT(__vec,__idx,__val) \
	do{ \
		if( (__idx) < VECTOR_LENGTH(__vec) ) /* move data */ \
			memmove(&VECTOR_INDEX(__vec,(__idx)+1),&VECTOR_INDEX(__vec,__idx),(VECTOR_LENGTH(__vec)-(__idx))*sizeof(VECTOR_FIRST(__vec))); \
		VECTOR_INDEX(__vec,__idx) = (__val); /* set value */ \
		++VECTOR_LENGTH(__vec); /* increase length */ \
	}while(0)



/// Inserts a value in the target index. (using memcpy)
/// Assumes the index is valid and there is enough capacity.
///
/// @param __vec Vector
/// @param __idx Index
/// @param __val Value
#define VECTOR_INSERTCOPY(__vec,__idx,__val) \
	VECTOR_INSERTARRAY(__vec,__idx,&(__val),1)



/// Inserts the values of the array in the target index. (using memcpy)
/// Assumes the index is valid and there is enough capacity.
///
/// @param __vec Vector
/// @param __idx Index
/// @param __pval Array of values
/// @param __n Number of values
#define VECTOR_INSERTARRAY(__vec,__idx,__pval,__n) \
	do{ \
		if( (__idx) < VECTOR_LENGTH(__vec) ) /* move data */ \
			memmove(&VECTOR_INDEX(__vec,(__idx)+(__n)),&VECTOR_INDEX(__vec,__idx),(VECTOR_LENGTH(__vec)-(__idx))*sizeof(VECTOR_FIRST(__vec))); \
		memcpy(&VECTOR_INDEX(__vec,__idx), (__pval), (__n)*sizeof(VECTOR_FIRST(__vec))); /* set values */ \
		VECTOR_LENGTH(__vec) += (__n); /* increase length */ \
	}while(0)



/// Inserts a zeroed value in the end of the vector.
/// Assumes there is enough capacity.
///
/// @param __vec Vector
#define VECTOR_PUSHZEROED(__vec) \
	do{ \
		memset(&VECTOR_INDEX(__vec,VECTOR_LENGTH(__vec)), 0, sizeof(VECTOR_INDEX(__vec,VECTOR_LENGTH(__vec)))); /* set zeroed value */ \
		++VECTOR_LENGTH(__vec); /* increase length */ \
	}while(0)


/// Inserts a value in the end of the vector. (using the '=' operator)
/// Assumes there is enough capacity.
///
/// @param __vec Vector
/// @param __val Value
#define VECTOR_PUSH(__vec,__val) \
	do{ \
		VECTOR_INDEX(__vec,VECTOR_LENGTH(__vec)) = (__val); /* set value */ \
		++VECTOR_LENGTH(__vec); /* increase length */ \
	}while(0)



/// Inserts a value in the end of the vector. (using memcpy)
/// Assumes there is enough capacity.
///
/// @param __vec Vector
/// @param __val Value
#define VECTOR_PUSHCOPY(__vec,__val) \
	VECTOR_PUSHARRAY(__vec,&(__val),1)



/// Inserts the values of the array in the end of the vector. (using memcpy)
/// Assumes there is enough capacity.
///
/// @param __vec Vector
/// @param __pval Array of values
/// @param __n Number of values
#define VECTOR_PUSHARRAY(__vec,__pval,__n) \
	do{ \
		memcpy(&VECTOR_INDEX(__vec,VECTOR_LENGTH(__vec)), (__pval), (__n)*sizeof(VECTOR_FIRST(__vec))); /* set values */ \
		VECTOR_LENGTH(__vec) += (__n); /* increase length */ \
	}while(0)



/// Removes and returns the last value of the vector.
/// Assumes the array is not empty.
///
/// @param __vec Vector
/// @return Removed value
#define VECTOR_POP(__vec) \
	( VECTOR_INDEX(__vec,--VECTOR_LENGTH(__vec)) )



/// Removes the last N values of the vector and returns the value of the last pop.
/// Assumes there are enough values.
///
/// @param __vec Vector
/// @param __n Number of pops
/// @return Last removed value
#define VECTOR_POPN(__vec,__n) \
	( VECTOR_INDEX(__vec,(VECTOR_LENGTH(__vec)-=(__n))) )



/// Removes the target index from the vector.
/// Assumes the index is valid and there are enough values.
///
/// @param __vec Vector
/// @param __idx Index
#define VECTOR_ERASE(__vec,__idx) \
	VECTOR_ERASEN(__vec,__idx,1)



/// Removes N values from the target index of the vector.
/// Assumes the index is valid and there are enough values.
///
/// @param __vec Vector
/// @param __idx Index
/// @param __n Number of values
#define VECTOR_ERASEN(__vec,__idx,__n) \
	do{ \
		if( (__idx) < VECTOR_LENGTH(__vec)-(__n) ) /* move data */ \
			memmove(&VECTOR_INDEX(__vec,__idx),&VECTOR_INDEX(__vec,(__idx)+(__n)),(VECTOR_LENGTH(__vec)-((__idx)+(__n)))*sizeof(VECTOR_FIRST(__vec))); \
		VECTOR_LENGTH(__vec) -= (__n); /* decrease length */ \
	}while(0)



/// Clears the vector, freeing allocated data.
///
/// @param __vec Vector
#define VECTOR_CLEAR(__vec) \
	do{ \
		if( VECTOR_CAPACITY(__vec) ) \
		{ \
			aFree(VECTOR_DATA(__vec)); VECTOR_DATA(__vec) = NULL; /* clear allocated array */ \
			VECTOR_CAPACITY(__vec) = 0; /* clear capacity */ \
			VECTOR_LENGTH(__vec) = 0; /* clear length */ \
		} \
	}while(0)



/////////////////////////////////////////////////////////////////////
// Binary heap library based on defines. (uses the vector defines above)
// uses aMalloc, aRealloc, aFree



/// Declares an anonymous binary heap struct.
///
/// @param __type Type of data
#define BHEAP_DECL(__type) VECTOR_DECL(__type)



/// Declares a named binary heap struct.
///
/// @param __name Structure name
/// @param __type Type of data
#define BHEAP_STRUCT_DECL(__name,__type) VECTOR_STRUCT_DECL(__name,__type)



/// Declares and initializes an anonymous binary heap variable.
///
/// @param __type Type of data
/// @param __var Variable name
#define BHEAP_VAR(__type,__var) VECTOR_VAR(__type,__var)



/// Declares and initializes a named binary heap variable.
///
/// @param __name Structure name
/// @param __var Variable name
#define BHEAP_STRUCT_VAR(__name,__var) VECTOR_STRUCT_VAR(__name,__var)



/// Initializes a heap.
///
/// @param __heap Binary heap
#define BHEAP_INIT(__heap) VECTOR_INIT(__heap)



/// Returns the internal array of values.
///
/// @param __heap Binary heap
/// @return Array of values
#define BHEAP_DATA(__heap) VECTOR_DATA(__heap)



/// Returns the length of the heap.
///
/// @param __heap Binary heap
/// @return Length
#define BHEAP_LENGTH(__heap) VECTOR_LENGTH(__heap)



/// Returns the capacity of the heap.
///
/// @param __heap Binary heap
/// @return Capacity
#define BHEAP_CAPACITY(__heap) VECTOR_CAPACITY(__heap)



/// Ensures that the heap has the target number of empty positions.
/// Increases the capacity in multiples of __step.
///
/// @param __heap Binary heap
/// @param __n Empty positions
/// @param __step Increase
#define BHEAP_ENSURE(__type,__heap,__n,__step) VECTOR_ENSURE(__type,__heap,__n,__step)



/// Returns the top value of the heap.
/// Assumes the heap is not empty.
///
/// @param __heap Binary heap
/// @return Value at the top
#define BHEAP_PEEK(__heap) VECTOR_INDEX(__heap,0)



/// Inserts a value in the heap. (using the '=' operator)
/// Assumes there is enough capacity.
///
/// The comparator takes two values as arguments, returns:
/// - negative if the first value is on the top
/// - positive if the second value is on the top
/// - 0 if they are equal
///
/// @param __heap Binary heap
/// @param __val Value
/// @param __topcmp Comparator
#define BHEAP_PUSH(__heap,__val,__topcmp) \
	do{ \
		size_t _i_ = VECTOR_LENGTH(__heap); \
		VECTOR_PUSH(__heap,__val); /* insert at end */ \
		while( _i_ ) \
		{ /* restore heap property in parents */ \
			size_t _parent_ = (_i_-1)/2; \
			if( __topcmp(VECTOR_INDEX(__heap,_parent_),VECTOR_INDEX(__heap,_i_)) < 0 ) \
				break; /* done */ \
			darkstar_swap(VECTOR_INDEX(__heap,_parent_),VECTOR_INDEX(__heap,_i_)); \
			_i_ = _parent_; \
		} \
	}while(0)



/// Removes the top value of the heap. (using the '=' operator)
/// Assumes the heap is not empty.
///
/// The comparator takes two values as arguments, returns:
/// - negative if the first value is on the top
/// - positive if the second value is on the top
/// - 0 if they are equal
///
/// @param __heap Binary heap
/// @param __topcmp Comparator
#define BHEAP_POP(__heap,__topcmp) BHEAP_POPINDEX(__heap,0,__topcmp)



/// Removes the target value of the heap. (using the '=' operator)
/// Assumes the index exists.
///
/// The comparator takes two values as arguments, returns:
/// - negative if the first value is on the top
/// - positive if the second value is on the top
/// - 0 if they are equal
///
/// @param __heap Binary heap
/// @param __idx Index
/// @param __topcmp Comparator
#define BHEAP_POPINDEX(__heap,__idx,__topcmp) \
	do{ \
		size_t _i_ = __idx; \
		VECTOR_INDEX(__heap,__idx) = VECTOR_POP(__heap); /* put last at index */ \
		while( _i_ ) \
		{ /* restore heap property in parents */ \
			size_t _parent_ = (_i_-1)/2; \
			if( __topcmp(VECTOR_INDEX(__heap,_parent_),VECTOR_INDEX(__heap,_i_)) < 0 ) \
				break; /* done */ \
			darkstar_swap(VECTOR_INDEX(__heap,_parent_),VECTOR_INDEX(__heap,_i_)); \
			_i_ = _parent_; \
		} \
		while( _i_ < VECTOR_LENGTH(__heap) ) \
		{ /* restore heap property in childs */ \
			size_t _lchild_ = _i_*2 + 1; \
			size_t _rchild_ = _i_*2 + 2; \
			if( (_lchild_ >= VECTOR_LENGTH(__heap) || __topcmp(VECTOR_INDEX(__heap,_i_),VECTOR_INDEX(__heap,_lchild_)) <= 0) && \
				(_rchild_ >= VECTOR_LENGTH(__heap) || __topcmp(VECTOR_INDEX(__heap,_i_),VECTOR_INDEX(__heap,_rchild_)) <= 0) ) \
				break; /* done */ \
			else if( _rchild_ >= VECTOR_LENGTH(__heap) || __topcmp(VECTOR_INDEX(__heap,_lchild_),VECTOR_INDEX(__heap,_rchild_)) <= 0 ) \
			{ /* left child */ \
				darkstar_swap(VECTOR_INDEX(__heap,_i_),VECTOR_INDEX(__heap,_lchild_)); \
				_i_ = _lchild_; \
			} \
			else \
			{ /* right child */ \
				darkstar_swap(VECTOR_INDEX(__heap,_i_),VECTOR_INDEX(__heap,_rchild_)); \
				_i_ = _rchild_; \
			} \
		} \
	}while(0)



/// Clears the binary heap, freeing allocated data.
///
/// @param __heap Binary heap
#define BHEAP_CLEAR(__heap) VECTOR_CLEAR(__heap)



/// Generic comparator for a min-heap. (minimum value at top)
/// Returns -1 if v1 is smaller, 1 if v2 is smaller, 0 if equal.
///
/// @param v1 First value
/// @param v2 Second value
/// @return negative if v1 is top, positive if v2 is top, 0 if equal
#define BHEAP_MINTOPCMP(v1,v2) ( v1 == v2 ? 0 : v1 < v2 ? -1 : 1 )



/// Generic comparator for a max-heap. (maximum value at top)
/// Returns -1 if v1 is bigger, 1 if v2 is bigger, 0 if equal.
///
/// @param v1 First value
/// @param v2 Second value
/// @return negative if v1 is top, positive if v2 is top, 0 if equal
#define BHEAP_MAXTOPCMP(v1,v2) ( v1 == v2 ? 0 : v1 > v2 ? -1 : 1 )


///////////////////////////////

#endif // _DB_H
