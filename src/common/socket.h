// Copyright (c) 2010-2015 Darkstar Dev Teams

#ifndef	_SOCKET_H_
#define _SOCKET_H_

#ifndef _CBASETYPES_H_
	#include "../common/cbasetypes.h"
#endif

#ifdef __APPLE__
	#include <CoreFoundation/CoreFoundation.h>
#endif

#ifdef WIN32
    #define FD_SETSIZE 1000
	#include <winsock2.h>
	typedef long in_addr_t;
#else
	#include <sys/types.h>
	#include <sys/socket.h>
    #include <arpa/inet.h>
	#include <netinet/in.h>
	#include <errno.h>
#endif

#include <time.h>
#include <memory>
#include <string>



/*
*
*				COMMON LEVEL
*
*/
/////////////////////////////////////////////////////////////////////
#if defined(WIN32)
/////////////////////////////////////////////////////////////////////
// windows portability layer 
typedef int socklen_t;

#define sErrno WSAGetLastError()
#define S_ENOTSOCK WSAENOTSOCK
#define S_EWOULDBLOCK WSAEWOULDBLOCK
#define S_EINTR WSAEINTR
#define S_ECONNABORTED WSAECONNABORTED


#define SHUT_RD   SD_RECEIVE
#define SHUT_WR   SD_SEND
#define SHUT_RDWR SD_BOTH

// global array of sockets (emulating linux)
// fd is the position in the array
extern SOCKET sock_arr[FD_SETSIZE];
extern int sock_arr_len;

/// Returns the socket associated with the target fd.
///
/// @param fd Target fd.
/// @return Socket
#define fd2sock(fd) sock_arr[fd]

/// Returns the first fd associated with the socket.
/// Returns -1 if the socket is not found.
///
/// @param s Socket
/// @return Fd or -1
int sock2fd(SOCKET s);


/// Inserts the socket into the global array of sockets.
/// Returns a new fd associated with the socket.
/// If there are too many sockets it closes the socket, sets an error and 
//  returns -1 instead.
/// Since fd 0 is reserved, it returns values in the range [1,FD_SETSIZE[.
///
/// @param s Socket
/// @return New fd or -1
int sock2newfd(SOCKET s);

int sAccept(int fd, struct sockaddr* addr, int* addrlen);

int sClose(int fd);
int sSocket(int af, int type, int protocol);

#define sBind(fd,name,namelen) bind(fd2sock(fd),name,namelen)
#define sListen(fd,backlog) listen(fd2sock(fd),backlog)
#define sIoctl(fd,cmd,argp) ioctlsocket(fd2sock(fd),cmd,argp)
#define sConnect(fd,name,namelen) connect(fd2sock(fd),name,namelen)
#define sRecv(fd,buf,len,flags) recv(fd2sock(fd),buf,len,flags)
#define sRecvfrom(fd,buf,len,flags,from,addrlen) recvfrom(fd2sock(fd),buf,len,flags,from,addrlen)
#define sSelect select
#define sSend(fd,buf,len,flags) send(fd2sock(fd),buf,len,flags)
#define sSendto(fd,buf,len,flags,to,addrlen) sendto(fd2sock(fd),buf,len,flags,to,addrlen)
#define sSetsockopt(fd,level,optname,optval,optlen) setsockopt(fd2sock(fd),level,optname,optval,optlen)
#define sShutdown(fd,how) shutdown(fd2sock(fd),how)
#define sFD_SET(fd,set) FD_SET(fd2sock(fd),set)
#define sFD_CLR(fd,set) FD_CLR(fd2sock(fd),set)
#define sFD_ISSET(fd,set) FD_ISSET(fd2sock(fd),set)
#define sFD_ZERO FD_ZERO
#else
// nix portability layer

#define SOCKET_ERROR (-1)

#define sErrno errno
#define S_ENOTSOCK EBADF
#define S_EWOULDBLOCK EAGAIN
#define S_EINTR EINTR
#define S_ECONNABORTED ECONNABORTED

#define sAccept accept
#define sClose close
#define sSocket socket

#define sBind bind
#define sConnect connect
#define sIoctl ioctl
#define sListen listen
#define sRecv recv
#define sRecvfrom recvfrom
#define sSelect select
#define sSend send
#define sSendto sendto
#define sSetsockopt setsockopt
#define sShutdown shutdown
#define sFD_SET FD_SET
#define sFD_CLR FD_CLR
#define sFD_ISSET FD_ISSET
#define sFD_ZERO FD_ZERO

#endif

#define TOB(n) ((uint8)((n)&std::numeric_limits<uint8>::max()))
#define TOW(n) ((uint16)((n)&std::numeric_limits<uint16>::max()))
#define TOL(n) ((uint32)((n)&std::numeric_limits<uint32>::max()))

enum class socket_type
{
    TCP,
    UDP
};

extern socket_type SOCKET_TYPE;

extern fd_set readfds;
extern int fd_max;
extern time_t last_tick;
extern time_t stall_time;

int32 makeConnection(uint32 ip, uint16 port, int32 type);

int32 do_sockets(fd_set* rfd,duration next);

void do_close(int32 fd);

void socket_init();

void socket_final();

// hostname/ip conversion functions
uint32 host2ip(const char* hostname);

const char* ip2str(uint32 ip, char ip_str[16]);

uint32 str2ip(const char* ip_str);

#define CONVIP(ip) ((ip)>>24)&0xFF,((ip)>>16)&0xFF,((ip)>>8)&0xFF,((ip)>>0)&0xFF

uint16 ntows(uint16 netshort);

int socket_getips(uint32* ips, int max);

extern uint32 g_addr_[16];   // ip addresses of local host (host byte order)

extern int32 naddr_;   // # of ip addresses

/************************************************/
/*
*
*		TCP LEVEL
*
*/

// initial recv buffer size (this will also be the max. size)
// biggest known packet: S 0153 <len>.w <emblem data>.?B -> 24x24 256 color .bmp (0153 + len.w + 1618/1654/1756 bytes)
#define RFIFO_SIZE (2*1024)
// initial send buffer size (will be resized as needed)
#define WFIFO_SIZE (16*1024)

// Maximum size of pending data in the write fifo. (for non-server connections)
// The connection is closed if it goes over the limit.
#define WFIFO_MAX (1*1024*1024)

// Struct declaration
typedef int (*RecvFunc)(int fd);
typedef int (*SendFunc)(int fd);
typedef int (*ParseFunc)(int fd);

// socket I/O macros
#define RFIFOHEAD(fd)
#define WFIFOHEAD(fd, size) do{ if((fd) && session[fd]->wdata_size + (size) > session[fd]->max_wdata ) realloc_writefifo(fd, size); }while(0)
//-------------------
#define RFIFOP(fd,pos) (session[fd]->rdata + session[fd]->rdata_pos + (pos))
#define WFIFOP(fd,pos) (session[fd]->wdata + session[fd]->wdata_size + (pos))

#define RFIFOB(fd,pos) (*(uint8*)RFIFOP(fd,pos))
#define WFIFOB(fd,pos) (*(uint8*)WFIFOP(fd,pos))
#define RFIFOW(fd,pos) (*(uint16*)RFIFOP(fd,pos))
#define WFIFOW(fd,pos) (*(uint16*)WFIFOP(fd,pos))
#define RFIFOL(fd,pos) (*(uint32*)RFIFOP(fd,pos))
#define WFIFOL(fd,pos) (*(uint32*)WFIFOP(fd,pos))

#define RFIFOREST(fd)  (session[fd]->flag.eof ? 0 : session[fd]->rdata.size() - session[fd]->rdata_pos)
#define RFIFOFLUSH(fd) \
	do { \
		if(session[fd]->rdata.size() == session[fd]->rdata_pos){ \
			session[fd]->rdata_pos = 0; \
            session[fd]->rdata.clear(); \
		} else { \
            session[fd]->rdata.erase(0, session[fd]->rdata_pos); \
			session[fd]->rdata_pos = 0; \
		} \
	} while(0)

struct socket_data
{
	struct {
		unsigned char eof : 1;
		unsigned char server : 1;
	} flag;

	uint32 client_addr; // remote client address

	std::string rdata, wdata;
	size_t rdata_pos;
	time_t rdata_tick; // time of last recv (for detecting timeouts); zero when timeout is disabled

	RecvFunc func_recv;
	SendFunc func_send;
	ParseFunc func_parse;

    bool ver_mismatch;
	void* session_data; // stores application-specific data related to the session
};

// Data prototype declaration
extern std::array<std::unique_ptr<socket_data>, FD_SETSIZE> session;
//////////////////////////////////
// some checking on sockets
bool session_isValid(int fd);
bool session_isActive(int fd);

int create_session(int fd, RecvFunc func_recv, SendFunc func_send, ParseFunc func_parse);
int delete_session(int fd);
//////////////////////////////////
int32 recv_to_fifo(int32 fd);

int32 send_from_fifo(int32 fd);

int32 connect_client(int32 listen_fd, sockaddr_in& client_address);

int32 makeConnection_tcp(uint32 ip, uint16 port);

int32 makeListenBind_tcp(const char* ip, uint16 port,RecvFunc connect_client);

int32 RFIFOSKIP(int32 fd, size_t len);

void socket_init_tcp(void);
void socket_final_tcp(void);

void do_close_tcp(int32 fd);

void flush_fifo(int32 fd);
void flush_fifos(void);
//void set_nonblocking(int32 fd, ulong yes);

void set_defaultparse(ParseFunc defaultparse);

void set_eof(int32 fd);

void set_nonblocking(int fd, unsigned long yes);

/*
*
*		UDP LEVEL
*
*/
extern int32 listen_fd;
int32 makeBind_udp(uint32 ip, uint16 port);

void socket_init_udp(void);
void do_close_udp(int32 fd);
void socket_final_udp(void);

int32 recvudp(int32 fd,void *buff,size_t nbytes,int32 flags,struct sockaddr *from, socklen_t *addrlen);
int32 sendudp(int32 fd,void *buff,size_t nbytes,int32 flags,const struct sockaddr *from,socklen_t addrlen);

template<typename T, typename U>
T& ref(U* buf, std::size_t index)
{
    return *reinterpret_cast<T*>(reinterpret_cast<uint8*>(buf) + index);
}

#endif // _SOCKET_H //
