#include "db.h"
#include "../common/malloc.h"
#include "../common/showmsg.h"


// Link DB System - jAthena
void linkdb_insert( struct linkdb_node** head, void *key, void* data)
{
	struct linkdb_node *node;
	if( head == NULL ) return ;
	node = (struct linkdb_node*)aMalloc( sizeof(struct linkdb_node) );
	if( *head == NULL ) {
		// first node
		*head      = node;
		node->prev = NULL;
		node->next = NULL;
	} else {
		// link nodes
		node->next    = *head;
		node->prev    = (*head)->prev;
		(*head)->prev = node;
		(*head)       = node;
	}
	node->key  = key;
	node->data = data;
}

void linkdb_foreach( struct linkdb_node** head, LinkDBFunc func, ...  )
{
	va_list args;
	struct linkdb_node *node;
	
	if( head == NULL ) return;
	
	va_start(args, func);
	node = *head;
	while ( node ) {
		func( node->key, node->data, args );
		node = node->next;
	}
}

void* linkdb_search( struct linkdb_node** head, void *key)
{
	int n = 0;
	struct linkdb_node *node;
	if( head == NULL ) return NULL;
	node = *head;
	while( node ) {
		if( node->key == key ) {
			if( node->prev && n > 5 ) {
				// ˆ—Œø—¦‰ü‘P‚Ìˆ×‚Éhead‚ÉˆÚ“®‚³‚¹‚é
				if(node->prev) node->prev->next = node->next;
				if(node->next) node->next->prev = node->prev;
				node->next = *head;
				node->prev = (*head)->prev;
				(*head)->prev = node;
				(*head)       = node;
			}
			return node->data;
		}
		node = node->next;
		n++;
	}
	return NULL;
}

void* linkdb_erase( struct linkdb_node** head, void *key)
{
	struct linkdb_node *node;
	if( head == NULL ) return NULL;
	node = *head;
	while( node ) {
		if( node->key == key ) {
			void *data = node->data;
			if( node->prev == NULL )
				*head = node->next;
			else
				node->prev->next = node->next;
			if( node->next )
				node->next->prev = node->prev;
			aFree( node );
			return data;
		}
		node = node->next;
	}
	return NULL;
}

void linkdb_replace( struct linkdb_node** head, void *key, void *data )
{
	int n = 0;
	struct linkdb_node *node;
	if( head == NULL ) return ;
	node = *head;
	while( node ) {
		if( node->key == key ) {
			if( node->prev && n > 5 ) {
				// ˆ—Œø—¦‰ü‘P‚Ìˆ×‚Éhead‚ÉˆÚ“®‚³‚¹‚é
				if(node->prev) node->prev->next = node->next;
				if(node->next) node->next->prev = node->prev;
				node->next = *head;
				node->prev = (*head)->prev;
				(*head)->prev = node;
				(*head)       = node;
			}
			node->data = data;
			return ;
		}
		node = node->next;
		n++;
	}
	// Œ©‚Â‚©‚ç‚È‚¢‚Ì‚Å‘}“ü
	linkdb_insert( head, key, data );
}

void linkdb_final( struct linkdb_node** head )
{
	struct linkdb_node *node, *node2;
	if( head == NULL ) return ;
	node = *head;
	while( node ) {
		node2 = node->next;
		aFree( node );
		node = node2;
	}
	*head = NULL;
}