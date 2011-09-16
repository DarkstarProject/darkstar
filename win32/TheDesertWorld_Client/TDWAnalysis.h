//------------------------------------------------------------------------------
//  File: TDWAnalysis.h
//  Desc: ffxiｵﾄｽ簧･ﾔｪ     
//  Revision history:
//      * 2007/08/10 Created by Muzisoft05@163.com.
//
//  Todo:
//
//------------------------------------------------------------------------------


#include <d3d9.h>
#include <d3dx9math.h>

#include <vector>
#include <string>

#pragma pack(push,1)

typedef struct {
  int syuzoku;
  int facetype;
  int head;
  int body;
  int waist;
  int hands;
  int legs;
  int buki;
} PC;

typedef struct {
  std::string syuzoku;
  std::string facetype;
  std::string head;
  std::string body;
  std::string waist;
  std::string hands;
  std::string legs;
  std::string buki;
} PCFNO;

typedef struct 
{
  float x1,x2,y1,y2,z1,z2;
} OOO;

typedef struct 
{
  DWORD  id;
  long   type:7;
  long   next:19;
  long   is_shadow:1;
  long   is_extracted:1;
  long   ver_num:3;
  long   is_virtual:1;
	//ResourceHeader * parent;
	//ResourceHeader * next;
} DATHEAD;

typedef struct
{
  BYTE  flg;
  char id[16];
  DWORD dwnazo1;
  long  imgx, imgy;
  DWORD dwnazo2[6];
  DWORD widthbyte;
  DWORD palet[0x100];
} IMGINFO;

typedef struct
{
  DWORD idno;
  WORD itemtype;
  WORD nazo11[0x02];
  DWORD no;
  WORD lvl;
  WORD basyo;
  WORD syuzoku;
  WORD jobs;
  WORD dmg;
  WORD kaku;
  WORD nazo13;
  WORD type;
  char namej[22];
  char namee[22];
  char info[96];
  char infoe[96];
  char nazo2[512-0x1e-22-22-96-96];

//0x200
  DWORD size;
  IMGINFO ii;
  BYTE img[0xa00-4-sizeof(IMGINFO)];
} BUKIINFO;

typedef struct
{
  DWORD idno;
  WORD itemtype;
  WORD nazo11[0x02];
  DWORD no;
  WORD lvl;
  WORD basyo;
  WORD syuzoku;
  WORD jobs;
  WORD dmg;
  WORD kaku;
  WORD nazo13;
  WORD type;
  char namet[22];
  char name[34];
  char name2[64];
  char name2s[64];
  char info[96];
  char nazo2[512-0x1e-22-34-64-64-96];

//0x200
  DWORD size;
  IMGINFO ii;
  BYTE img[0xa00-4-sizeof(IMGINFO)];
} BUKIINFOE;

typedef struct
{
  DWORD idno;
  WORD itemtype;
  WORD nazo11[2];
  DWORD no;
  WORD lvl;
  WORD basyo;
  WORD syuzoku;
  WORD jobs;
  WORD dex;
  char namej[22];
  char namee[22];
  char info[96];
  char infoe[96];
  char nazo2[0x200-0x18-22-22-96-96];

//0x200
  DWORD size;
  IMGINFO ii;
  BYTE img[0xa00-4-sizeof(IMGINFO)];
} BOGUINFO;

typedef struct
{
  DWORD idno;
  WORD itemtype;
  WORD nazo11[2];
  DWORD no;
  WORD lvl;
  WORD basyo;
  WORD syuzoku;
  WORD jobs;
  WORD dex;

  char namet[22];
  char name[34];
  char name2[64];
  char name2s[64];
  char info[96];
  char nazo2[0x200-0x18-22-34-64-64-96];

//0x200
  DWORD size;
  IMGINFO ii;
  BYTE img[0xa00-4-sizeof(IMGINFO)];
} BOGUINFOE;

typedef struct
{
  DWORD idno;
  WORD itemtype;
  WORD  nazo1[4];
  char namej[22];
  char namee[22];
  char info[96];
  char infoe[96];
  char nazo2[0x200-14-22-22-96-96];

//0x200
  DWORD size;
  IMGINFO ii;
  BYTE img[0xa00-4-sizeof(IMGINFO)];
} ITEMINFO;

typedef struct
{
  DWORD idno;
  WORD itemtype;
  WORD  nazo1[4];
  char namet[22];
  char name[34];
  char name2[64];
  char name2s[64];
  char info[96];
  char nazo2[0x200-14-22-34-64-64-96];

//0x200
  DWORD size;
  IMGINFO ii;
  BYTE img[0xa00-4-sizeof(IMGINFO)];
} ITEMINFOE;

typedef struct
{
  DWORD idno;
  WORD itemtype;
  WORD nazo1[4];
  char namej[22];
  char namee[22];
  char info[96];
  char infoe[96];
  char nazo2[0x200-14-22-22-96-96];

//0x200
  DWORD size;
  IMGINFO ii;
  BYTE img[0xa00-4-sizeof(IMGINFO)];
} CHOUDOINFO;

typedef struct
{
  DWORD idno;
  WORD itemtype;
  WORD nazo1[4];
  char namet[22];
  char name[34];
  char name2[64];
  char name2s[64];
  char info[96];
  char nazo2[0x200-14-22-34-64-64-96];

//0x200
  DWORD size;
  IMGINFO ii;
  BYTE img[0xa00-4-sizeof(IMGINFO)];
} CHOUDOINFOE;

typedef struct
{
  DWORD idno;
  WORD nazo1[5];
  char namej[22];
  char namee[22];
  char infoj[96];
  char infoe[96];
  char nazo2[0x200-14-22-22-96-96];

//0x200
  DWORD size;
  IMGINFO ii;
  BYTE img[0xa00-4-sizeof(IMGINFO)];
} MATEINFO;

typedef struct
{
  DWORD idno;
  WORD nazo1[5];
  char namet[22];
  char name[34];
  char name2[64];
  char name2s[64];
  char info[96];
  char nazo2[0x200-14-22-34-64-64-96];

//0x200
  DWORD size;
  IMGINFO ii;
  BYTE img[0xa00-4-sizeof(IMGINFO)];
} MATEINFOE;

typedef struct
{
  WORD nazo1[5];
  char namej[32];
  char info[96];
  char nazo2[0x400-10-32-96];
} ABIINFO;

typedef struct
{
  WORD nazo1[5];
  char name[32];
  char info[96];
  char nazo2[0x400-10-32-96];
} ABIINFOE;

typedef struct
{
  short no;
  short syu;
  short zoku;
  short flg1;
  short flg2;
  short mp;
  BYTE reeisyou;
  BYTE eisyou;
  BYTE joblvl[16];
  char nazo11;
  char namej[20];
  char namee[20];
  char infoj[128];
  char infoe[128];
  char nazo2[0x400-0x1f-20-20-128-128];
} MAGINFO;

typedef struct
{
  short no;
  short syu;
  short zoku;
  short flg1;
  short flg2;
  short mp;
  BYTE reeisyou;
  BYTE eisyou;
  BYTE joblvl[16];
  char nazo11;
  char namej[20];
  char namee[20];
  char infoj[128];
  char infoe[128];
  char nazo2[0x400-0x1f-20-20-128-128];
} MAGINFOE;

typedef struct
{
  char nazo1[2];
  char namej[32];
  char namee[32];
  char infoj[128];
  char infoe[128];
  char nazo2[512-2-32-32-128-128];

//0x200
  DWORD size;
  IMGINFO ii;
  BYTE img[0xa00-4-sizeof(IMGINFO)];
} STATINFO;

typedef struct
{
  char nazo1[2];
  char namej[32];
  char namee[32];
  char infoj[128];
  char infoe[128];
  char nazo2[512-2-32-32-128-128];

//0x200
  DWORD size;
  IMGINFO ii;
  BYTE img[0xa00-4-sizeof(IMGINFO)];
} STATINFOE;

typedef struct
{
  char id[16];
  float fTransX,fTransY,fTransZ;
  float fRotX,fRotY,fRotZ;
  float fScaleX,fScaleY,fScaleZ;
  float fa,fb,fc,fd;
  long  fe,ff,fg,fh,fi,fj,fk,fl;
} OBJINFO;

typedef  struct
{
  //short d[12];
  short lt_x, lt_y;
  short rt_x, rt_y;
  short lb_x, bt_y;
  short rb_x, rb_y;
  short srcsx,srcsy; 
  short srcpx,srcpy; 
  char invxy;
  DWORD nano2[4];
  char nano3[4];
  char imgid[16];
} MENU31;

#pragma pack(push,2)

typedef struct
{
  int   no;
  int   idx_qtx,idx_qty,idx_qtz,idx_qtw;
  float qtx,qty,qtz,qtw;
  int   idx_tx,idx_ty,idx_tz;
  float tx,ty,tz;
  int   idx_sx,idx_sy,idx_sz;
  float   sx,sy,sz;
} DAT2B;


typedef struct{
  BYTE  ver;     //0x00
  BYTE  nazo;    //0x01
  WORD  type;    //0x02 &7f==0モデル 1=クロス
  WORD  flip;    //0x04 0==OFF  ON

  DWORD offsetPoly;       //0x06
  WORD  PolySuu;        //0x0A  //PolySuu
  DWORD offsetBoneTbl;      //0x0C
  WORD  BoneTblSuu;        //0x10
  DWORD offsetWeight;   //0x12
  WORD  WeightSuu;      //0x16
  DWORD offsetBone;   //0x18
  WORD  BoneSuu;        //0x1C
  DWORD offsetVertex;    //0x1E  
  WORD  VertexSuu;   //0x22
  DWORD offsetPolyLoad;  //0x24
  WORD  PolyLoadSuu;       //0x28
  WORD  PolyLodVtx0Suu;  //0x2A
  WORD  PolyLodVtx1Suu;  //0x2C
  DWORD offsetPolyLod2;     //0x2E
  WORD   PolyLod2Suu;       //0x32
//---------------------------------------
  DWORD  nazo1;       //0x34
  DWORD  nazo2;       //0x38
  WORD   nazo3;       //0x3C
  WORD   nazo4;       //0x3E
} DAT2AHeader;

#pragma warning(disable:4200)
typedef struct{
  BYTE  ver;     //0x00
  BYTE  nazo;    //0x01
  WORD  element;
  WORD  frame;
  float speed;
  union{
    float f[];   //waring出るけど許してね
    DAT2B dat[]; //waring出るけど許してね
  };
} DAT2BHeader;

#pragma pack(pop)

#pragma pack(push,1)
typedef struct
{
  short i1,i2,i3;
  float u1,v1;
  float u2,v2;
  float u3,v3;
} TEXLIST;
typedef struct
{
  short i;
  float u,v;
} TEXLIST2;
typedef struct 
{
  BYTE parent;
  BYTE term;
  float i,l,k,j;
  float x,y,z;
} BONE;
typedef struct 
{
  WORD no;             //ボーン番号を指してるッぽい 指定のボーンに依存しているって言うこと？
  float a,b,c,d,e,f;
} BONE2;  
typedef struct 
{
  DWORD col;
  float dat1[7];
  DWORD ddd1;
  DWORD ddd2;
  float dat2;
} dat8000;
typedef struct _D3DTEXVERTEX
{
  float x,y,z;     //座標
  float hx,hy,hz;  //法線ベクトル
  DWORD color;     //色
  float tu,tv;     // UV座標
} D3DTEXVERTEX;

#define D3DFVF_TEXVERTEX (D3DFVF_XYZ|D3DFVF_DIFFUSE|D3DFVF_NORMAL|D3DFVF_TEX1) 

inline FLOAT DEGtoRAD(float angle)
{
  return (angle-90.0f)*3.1415926f/180.0f;
}

typedef struct
{
  float x,y,z;     //座標
  float hx,hy,hz;  //法線ベクトル
} MODELVERTEX1;

typedef struct  //これで確定
{
  float x1,x2,y1,y2,z1,z2;
  float w1,w2;
  float hx1,hx2;  //法線ベクトル
  float hy1,hy2;  //法線ベクトル
  float hz1,hz2;  //法線ベクトル
} MODELVERTEX2;

typedef struct
{
  float x,y,z;     //座標
} CLOTHVERTEX1;

typedef struct
{
  float x1,x2;
  float y1,y2;
  float z1,z2;
  float w1,w2;
} CLOTHVERTEX2;

#pragma pack(pop)

typedef struct 
{
  char ID[17];
  LPDIRECT3DTEXTURE9 pTex; 
} TEXTEX;

#pragma pack(pop)

typedef struct
{
  int weight1;
  int weight2;
  WORD *pBone;
  WORD *pBoneTbl;
  MODELVERTEX1 *pVertex;
  MODELVERTEX2 *pVertex2;
  CLOTHVERTEX1 *pVertexC;
  CLOTHVERTEX2 *pVertexC2;
  char *pPoly;
  char *dat2A;
  DAT2AHeader *dat2ahead;
} DAT2A;

extern COLORREF colBk;
extern char ffxidir[512];

BOOL GetFileNameFromFileID(LPSTR filename,DWORD dwID);
void GetRorStr(LPSTR a,LPSTR b,int c) ;
BOOL GetBMPImage(IMGINFO *ii, BYTE *ppImage );
void LocateFFXIDataFolder(void);
BOOL IsImg(LPSTR p);
BOOL IsImage(IMGINFO *ii);

int BitCount(BYTE x);
void decode_mmb(BYTE *p);
void decode_mzb(BYTE *p);

class FFXIFile
{
	LPSTR pData;
	char filename[256];
	BOOL Load(void);

public:
	char *pdat;
	DWORD dwSize;
	int vnum;
	int fnum;

	FFXIFile() 
	{ 
		pdat = NULL; 
		pData = NULL; 
		dwSize = 0; 
	}
   ~FFXIFile() 
   { 
	   Free(); 
   }

	DWORD GetSize(){return dwSize;}
	BOOL IsNull(){
		return (!pdat || dwSize==0);
	}
	BOOL IsFFXIFormat()
	{   
		if( IsNull() ) return FALSE;
		DATHEAD *phd = (DATHEAD *)pdat;
		if( phd->next<=0 || dwSize<(DWORD)phd->next*16 ) return FALSE;
		//if( phd->type!=0x01) return FALSE;
		return TRUE;
	}
	LPSTR FistData(DATHEAD *phd)
	{
		if( !pdat ) return NULL;
		*phd = *(DATHEAD *)pdat;
		pData = pdat;
		return pData;
	}
	LPSTR NextData(DATHEAD *phd)
	{
		if(!pData) return NULL;
		*phd = *(DATHEAD *)pData;
		int next = phd->next;
		if( next<=0 ) return NULL;
		if( pdat+dwSize<=pData+next*16 ) return NULL;
		pData += next*16;
		*phd = *(DATHEAD *)pData;
		return pData;
	}
	BOOL Free(void)
	{
		dwSize = 0;
		if( pdat )
		{
			delete []pdat;
			pdat = NULL;
		}
		pData=NULL;
		return TRUE;
	}
	LPSTR GetShortFilename()
	{
		return &filename[lstrlen(ffxidir)];
	}
	BOOL Load(DWORD fno);
	BOOL LoadF(int flg, int no);
};

