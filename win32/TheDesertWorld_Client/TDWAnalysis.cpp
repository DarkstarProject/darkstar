//------------------------------------------------------------------------------
//  File: TDWAnalysis.cpp
//  Desc: ffxi的解析单元     
//  Revision history:
//      * 2007/08/10 Created by Muzisoft05@163.com.
//
//  Todo:
//
//------------------------------------------------------------------------------

#define WIN32_LEAN_AND_MEAN
#include <windows.h>

#include "TDWAnalysis.h"

char ffxidir[512]; 

/************************************************************************
*                                                                       *
*																		*
*                                                                       *
************************************************************************/

void LocateFFXIDataFolder()
{
	HKEY hKey;
	memset(ffxidir,0,512);

	if (ERROR_SUCCESS == RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\PlayOnlineEU\\InstallFolder",0,KEY_READ,&hKey))
	{
		DWORD dwData = sizeof(ffxidir);
		DWORD dwType = REG_SZ;
		RegQueryValueEx(hKey,"0001",NULL,&dwType,(LPBYTE)ffxidir,&dwData);
		RegCloseKey( hKey );
	}
	if (lstrlen(ffxidir) == 0)
	{
		MessageBox(NULL,"1.没有找到FF11安装的注册表项,请在FINAL FANTASY XI文件夹下执行此程序.","提示",MB_OK);
		GetCurrentDirectory(sizeof(ffxidir),ffxidir);
	}
	if (lstrlen(ffxidir) > 0)
	{
		if (ffxidir[lstrlen(ffxidir)-1] != '\\')
		{
			lstrcat(ffxidir,"\\");
		}
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

static DWORD GetFileIDFromIDsub(DWORD dwV,DWORD dwID)
{
	HANDLE hFile;
	char fname[512];
	DWORD dwRead;
	BYTE v;
	WORD f;
 
	if( dwID >= 51439 ) return 0;
	
	lstrcpy(fname,ffxidir);	// ROM2傪挷傋傞

	switch (dwV)
	{
		case 1:	lstrcat(fname,"VTABLE.DAT"); break;
		case 2: lstrcat(fname,"ROM2\\VTABLE2.DAT"); break;
		case 3: lstrcat(fname,"ROM3\\VTABLE3.DAT"); break;
		default: return 0;
	}
	
	hFile = CreateFile(fname,GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_ARCHIVE,NULL);
	if (hFile == INVALID_HANDLE_VALUE) return 0;

	SetFilePointer(hFile,dwID,NULL,FILE_BEGIN);
	ReadFile(hFile,&v,1,&dwRead,NULL);
	CloseHandle(hFile);

	if (dwRead != 1 || v == 0) return 0;
	
	lstrcpy(fname,ffxidir);

	switch (dwV)
	{
		case 1:	lstrcat(fname,"FTABLE.DAT"); break;
		case 2: lstrcat(fname,"ROM2\\FTABLE2.DAT"); break;
		case 3: lstrcat(fname,"ROM3\\FTABLE3.DAT"); break;
		default: return 0;
	}

	hFile = CreateFile(fname,GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_ARCHIVE,NULL);
	if (hFile == INVALID_HANDLE_VALUE) return 0;

	SetFilePointer(hFile,dwID*2,NULL,FILE_BEGIN);
	ReadFile(hFile,&f,2,&dwRead,NULL);
	CloseHandle(hFile);

	if(dwRead != 2) return 0;

	return (DWORD)MAKELONG(f,v);
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

BOOL GetFileNameFromFileID(LPSTR filename,DWORD dwID)
{
	DWORD id;          
	DWORD no;

	id = GetFileIDFromIDsub(3,dwID); 
	if (id == 0) id = GetFileIDFromIDsub(2,dwID);
	if (id == 0) id = GetFileIDFromIDsub(1,dwID);
	if (id == 0) return FALSE;

	no = id & 0xffff;

	switch (HIWORD(id))
	{
		case 1:	wsprintf(filename,"%sROM\\%d\\%d.dat",ffxidir,no/0x80,no%0x80); break;
		case 2: wsprintf(filename,"%sROM2\\%d\\%d.dat",ffxidir,no/0x80,no%0x80); break;
		case 3: wsprintf(filename,"%sROM3\\%d\\%d.dat",ffxidir,no/0x80,no%0x80); break;
		default: return FALSE;
	}
	return TRUE;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

BOOL FFXIFile::Load(DWORD fno)
{
	Free();

	if (!GetFileNameFromFileID(filename,fno)) 
	{
		return FALSE;
	}

	return Load();
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

BOOL FFXIFile::LoadF(int flg, int no)
{
  Free();

  if(flg==0) wsprintf(filename,"%sROM\\%d\\%d.dat",ffxidir,no/1000,no%1000);  
  else       wsprintf(filename,"%sROM%d\\%d\\%d.dat",ffxidir,flg,no/1000,no%1000);

  return Load();
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

BOOL FFXIFile::Load(void)
{
  Free();

  HANDLE hFile = CreateFile(filename,GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_ARCHIVE,NULL);

  if( hFile!=INVALID_HANDLE_VALUE ){
    DWORD dmy;
    dwSize = GetFileSize(hFile,NULL);
    pdat = new char[dwSize];
    ReadFile(hFile,pdat,dwSize,&dmy,NULL);
    CloseHandle(hFile);
    return TRUE;
  }
  return FALSE;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

BOOL IsImage(IMGINFO *ii)
{

  if( ii->imgx < 0x4 ) return FALSE;
  if( ii->imgy < 0x4 ) return FALSE;
  if( ii->imgx > 4096 ) return FALSE;
  if( ii->imgy > 4096 ) return FALSE;
  if( ii->dwnazo1 != 40) return FALSE;
  if( ii->dwnazo2[0] != 0x80001 && ii->dwnazo2[0] != 0x40001 && ii->dwnazo2[0]!=0x200001 ) return FALSE;
  if( ii->dwnazo2[1] != 0) return FALSE;
  if( ii->dwnazo2[2] != 0) return FALSE;
  if( ii->dwnazo2[3] != 0) return FALSE;
  if( ii->dwnazo2[4] != 0) return FALSE;
  if( ii->dwnazo2[5] != 0) return FALSE;
  return TRUE;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

COLORREF colBk=RGB(255,255,255);

inline char ror(char a,int b)
{
  b&=0x7;
  return((char)(((BYTE)a)>>b|((BYTE)a)<<(8-b)));
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void GetRorStr(LPSTR a,LPSTR b,int c)
{
  for(;*a;a++,b++) *b=ror(*a,c);
  *b=0;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

#define psR(pl) ((((pl)>>16)&0xff)*(pl>>24)/0x80+GetRValue(colBk)*(0x80-(pl>>24))/0x80)
#define psG(pl) ((((pl)>> 8)&0xff)*(pl>>24)/0x80+GetGValue(colBk)*(0x80-(pl>>24))/0x80)
#define psB(pl) ((((pl)>> 0)&0xff)*(pl>>24)/0x80+GetBValue(colBk)*(0x80-(pl>>24))/0x80)

inline DWORD RGBtoBGR( DWORD pl )
{
  return (((pl&0xff0000)>>16)|((pl&0xff00))|((pl&0xff)<<16));
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

COLORREF GetRGB3(BYTE*p,int x,int y)
{
  BYTE *pp;
  pp = p;
  DWORD c1 = (DWORD)*(WORD*)(p+8);
  DWORD b1 = (c1&0x001f)<<3;
  DWORD g1 = (c1&0x07e0)>>3;
  DWORD r1 = (c1&0xf800)>>8;
  DWORD c2 = (DWORD)*(WORD*)(p+10);
  DWORD b2 = (c2&0x001f)<<3;
  DWORD g2 = (c2&0x07e0)>>3;
  DWORD r2 = (c2&0xf800)>>8;

  DWORD col;
  BYTE b = *(p+12+y);
  b = (b>>(x*2))&0x3;
  if( b==0 ) col = RGB(r1,g1,b1);
  if( b==1 ) col = RGB(r2,g2,b2);
  if( b==2 ) col = RGB((r1*2+r2)/3,(g1*2+g2)/3,(b1*2+b2)/3); //2/3-col1  1/3-cal2
  if( b==3 ) col = RGB((r2*2+r1)/3,(g2*2+g1)/3,(b2*2+b1)/3); //1/3-col1  2/3-cal2

  return col;

}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

COLORREF GetRGB1(BYTE*p,int x,int y)
{
  BYTE *pp;
  pp = p;
  DWORD c1 = (DWORD)*(WORD*)(p);
  DWORD b1 = (c1&0x001f)<<3;
  DWORD g1 = (c1&0x07e0)>>3;
  DWORD r1 = (c1&0xf800)>>8;
  DWORD c2 = (DWORD)*(WORD*)(p+2);
  DWORD b2 = (c2&0x001f)<<3;
  DWORD g2 = (c2&0x07e0)>>3;
  DWORD r2 = (c2&0xf800)>>8;

  DWORD col;

  BYTE b = *(p+4+y);
  b = (b>>(x*2))&0x3;

  if( b==0 ) col = RGB(r1,g1,b1);
  if( b==1 ) col = RGB(r2,g2,b2);
  if( c1>c2 ){
    if( b==2 ) col = RGB((r1*2+r2)/3,(g1*2+g2)/3,(b1*2+b2)/3); //2/3-col1  1/3-cal2
    if( b==3 ) col = RGB((r2*2+r1)/3,(g2*2+g1)/3,(b2*2+b1)/3); //1/3-col1  2/3-cal2
  }else{
    if( b==2 ) col = RGB((r1+r2)/2,(g1+g2)/2,(b1+b2)/2); //1/2-col1  1/2-cal2
    if( b==3 ) col = 0xffffffff; //摟夁
  }


  return col;

}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

#define psR2(pl)
#define psG2(pl)
#define psB2(pl)

BOOL IsImg(LPSTR p)
{
  IMGINFO *ii = (IMGINFO *)p;
  
  if( ii->imgx < 0x4 ) return FALSE;
  if( ii->imgy < 0x4 ) return FALSE;
  if( ii->imgx > 4096 ) return FALSE;
  if( ii->imgy > 4096 ) return FALSE;
  if( ii->dwnazo1 != 40) return FALSE;
  if( ii->dwnazo2[0] != 0x80001 && ii->dwnazo2[0] != 0x40001 && ii->dwnazo2[0]!=0x200001 ) return FALSE;
  if( ii->dwnazo2[1] != 0) return FALSE;
  if( ii->dwnazo2[2] != 0) return FALSE;
  if( ii->dwnazo2[3] != 0) return FALSE;
  if( ii->dwnazo2[4] != 0) return FALSE;
  if( ii->dwnazo2[5] != 0) return FALSE;

  return TRUE;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

BOOL GetBMPImage(IMGINFO *ii, BYTE *ppImage )
{
  DWORD *pal = ii->palet;
  int xx = ii->imgx;
  int yy = ii->imgy;
  DWORD *lpdwSrc = (DWORD *)ppImage;

  if( *pal == 'DXT3' || *pal == 'DXT1' ){
    //BYTE *b=(BYTE*)ii->palet;
    BYTE  *img = ((BYTE*)pal)+12;
    if( *pal == 'DXT3' ){
      for( int j=0; j<(xx/4)*(yy/4); j++ ){
        BYTE *p = &img[j*16];
        for( int k=0; k<4*4; k++ ){
          lpdwSrc[((j%(xx/4))*4+k%4)+((j/(xx/4))*4+k/4)*xx] = RGBtoBGR(GetRGB3(p,k%4,k/4));
        }
      }
    }else if( *pal == 'DXT1' ){
      for( int j=0; j<(xx/4)*(yy/4); j++ ){
        BYTE *p = &img[j*8];
        for( int k=0; k<4*4; k++ ){
          DWORD c = GetRGB1(p,k%4,k/4);
          if( c==0xffffffff ) c=colBk;
          lpdwSrc[((j%(xx/4))*4+k%4)+((j/(xx/4))*4+k/4)*xx] = RGBtoBGR(c);
        }
      }
    }
  }else{
    BYTE  *img = (BYTE*)(ii+1);
    if( ii->flg==0xb1  ){
      pal = ii->palet+1;
      img = ((BYTE*)(ii+1))+4;
    }
    //BMP偼忋壓傪媡揮偟偰側偗傟偽偄偗側偄丅
    for( int j1=0; j1<ii->imgy; j1++ ){
      DWORD *Dst = lpdwSrc+(ii->imgy-j1-1) * ii->imgx;
      for( int j2=0,j=j1*ii->imgx; j2<ii->imgx; j2++, j++, Dst++ ){
        DWORD col;
        if( ii->dwnazo2[0]!=0x200001 ){
          //Plet桳傝
          int p = (int)img[j];
          if( ii->widthbyte==32 ){
            if( (pal[p]>>24)>0x80 ){
              col = RGBtoBGR(RGB(pal[p]>>16,pal[p]>>8,pal[p]>>0));
            }else
              col = RGBtoBGR(RGB(psR(pal[p]),psG(pal[p]),psB(pal[p])));
          }else if( ii->widthbyte==16 ){
            DWORD pl = (DWORD)*(((WORD*)pal)+p);
            pl = (pl&0x1f)<<19 | (pl&0x3e0)<<6 |(pl&0x7c00)>>7 | (pl&0x8000)<<16; //兛偮偒
            if( (pl&0x80000000) ){
              col = RGBtoBGR(RGB(pl>>16,pl>>8,pl>>0));
            }else{
              col = RGBtoBGR(colBk);
            }
          }
        }else{
          //Palet柍偟
          col = *(((DWORD*)ii->palet)+j);
        }
        *Dst = col;
      }
    }
  }

  return TRUE;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

static BYTE key_table[0x100] =
{
	0xE2, 0xE5, 0x06, 0xA9, 0xED, 0x26, 0xF4, 0x42, 0x15, 0xF4, 0x81, 0x7F, 0xDE, 0x9A, 0xDE, 0xD0,
	0x1A, 0x98, 0x20, 0x91, 0x39, 0x49, 0x48, 0xA4, 0x0A, 0x9F, 0x40, 0x69, 0xEC, 0xBD, 0x81, 0x81,
	0x8D, 0xAD, 0x10, 0xB8, 0xC1, 0x88, 0x15, 0x05, 0x11, 0xB1, 0xAA, 0xF0, 0x0F, 0x1E, 0x34, 0xE6,
	0x81, 0xAA, 0xCD, 0xAC, 0x02, 0x84, 0x33, 0x0A, 0x19, 0x38, 0x9E, 0xE6, 0x73, 0x4A, 0x11, 0x5D,
	0xBF, 0x85, 0x77, 0x08, 0xCD, 0xD9, 0x96, 0x0D, 0x79, 0x78, 0xCC, 0x35, 0x06, 0x8E, 0xF9, 0xFE,
	0x66, 0xB9, 0x21, 0x03, 0x20, 0x29, 0x1E, 0x27, 0xCA, 0x86, 0x82, 0xE6, 0x45, 0x07, 0xDD, 0xA9,
	0xB6, 0xD5, 0xA2, 0x03, 0xEC, 0xAD, 0x62, 0x45, 0x2D, 0xCE, 0x79, 0xBD, 0x8F, 0x2D, 0x10, 0x18,
	0xE6, 0x0A, 0x6F, 0xAA, 0x6F, 0x46, 0x84, 0x32, 0x9F, 0x29, 0x2C, 0xC2, 0xF0, 0xEB, 0x18, 0x6F,
	0xF2, 0x3A, 0xDC, 0xEA, 0x7B, 0x0C, 0x81, 0x2D, 0xCC, 0xEB, 0xA1, 0x51, 0x77, 0x2C, 0xFB, 0x49,
	0xE8, 0x90, 0xF7, 0x90, 0xCE, 0x5C, 0x01, 0xF3, 0x5C, 0xF4, 0x41, 0xAB, 0x04, 0xE7, 0x16, 0xCC,
	0x3A, 0x05, 0x54, 0x55, 0xDC, 0xED, 0xA4, 0xD6, 0xBF, 0x3F, 0x9E, 0x08, 0x93, 0xB5, 0x63, 0x38,
	0x90, 0xF7, 0x5A, 0xF0, 0xA2, 0x5F, 0x56, 0xC8, 0x08, 0x70, 0xCB, 0x24, 0x16, 0xDD, 0xD2, 0x74,
	0x95, 0x3A, 0x1A, 0x2A, 0x74, 0xC4, 0x9D, 0xEB, 0xAF, 0x69, 0xAA, 0x51, 0x39, 0x65, 0x94, 0xA2,
	0x4B, 0x1F, 0x1A, 0x60, 0x52, 0x39, 0xE8, 0x23, 0xEE, 0x58, 0x39, 0x06, 0x3D, 0x22, 0x6A, 0x2D,
	0xD2, 0x91, 0x25, 0xA5, 0x2E, 0x71, 0x62, 0xA5, 0x0B, 0xC1, 0xE5, 0x6E, 0x43, 0x49, 0x7C, 0x58,
	0x46, 0x19, 0x9F, 0x45, 0x49, 0xC6, 0x40, 0x09, 0xA2, 0x99, 0x5B, 0x7B, 0x98, 0x7F, 0xA0, 0xD0,
};

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

static BYTE key_table2[0x100] =
{
	0xB8, 0xC5, 0xF7, 0x84, 0xE4, 0x5A, 0x23, 0x7B, 0xC8, 0x90, 0x1D, 0xF6, 0x5D, 0x09, 0x51, 0xC1,
	0x07, 0x24, 0xEF, 0x5B, 0x1D, 0x73, 0x90, 0x08, 0xA5, 0x70, 0x1C, 0x22, 0x5F, 0x6B, 0xEB, 0xB0,
	0x06, 0xC7, 0x2A, 0x3A, 0xD2, 0x66, 0x81, 0xDB, 0x41, 0x62, 0xF2, 0x97, 0x17, 0xFE, 0x05, 0xEF,
	0xA3, 0xDC, 0x22, 0xB3, 0x45, 0x70, 0x3E, 0x18, 0x2D, 0xB4, 0xBA, 0x0A, 0x65, 0x1D, 0x87, 0xC3,
	0x12, 0xCE, 0x8F, 0x9D, 0xF7, 0x0D, 0x50, 0x24, 0x3A, 0xF3, 0xCA, 0x70, 0x6B, 0x67, 0x9C, 0xB2,
	0xC2, 0x4D, 0x6A, 0x0C, 0xA8, 0xFA, 0x81, 0xA6, 0x79, 0xEB, 0xBE, 0xFE, 0x89, 0xB7, 0xAC, 0x7F,
	0x65, 0x43, 0xEC, 0x56, 0x5B, 0x35, 0xDA, 0x81, 0x3C, 0xAB, 0x6D, 0x28, 0x60, 0x2C, 0x5F, 0x31,
	0xEB, 0xDF, 0x8E, 0x0F, 0x4F, 0xFA, 0xA3, 0xDA, 0x12, 0x7E, 0xF1, 0xA5, 0xD2, 0x22, 0xA0, 0x0C,
	0x86, 0x8C, 0x0A, 0x0C, 0x06, 0xC7, 0x65, 0x18, 0xCE, 0xF2, 0xA3, 0x68, 0xFE, 0x35, 0x96, 0x95,
	0xA6, 0xFA, 0x58, 0x63, 0x41, 0x59, 0xEA, 0xDD, 0x7F, 0xD3, 0x1B, 0xA8, 0x48, 0x44, 0xAB, 0x91,
	0xFD, 0x13, 0xB1, 0x68, 0x01, 0xAC, 0x3A, 0x11, 0x78, 0x30, 0x33, 0xD8, 0x4E, 0x6A, 0x89, 0x05,
	0x7B, 0x06, 0x8E, 0xB0, 0x86, 0xFD, 0x9F, 0xD7, 0x48, 0x54, 0x04, 0xAE, 0xF3, 0x06, 0x17, 0x36,
	0x53, 0x3F, 0xA8, 0x11, 0x53, 0xCA, 0xA1, 0x95, 0xC2, 0xCD, 0xE6, 0x1F, 0x57, 0xB4, 0x7F, 0xAA,
	0xF3, 0x6B, 0xF9, 0xA0, 0x27, 0xD0, 0x09, 0xEF, 0xF6, 0x68, 0x73, 0x60, 0xDC, 0x50, 0x2A, 0x25,
	0x0F, 0x77, 0xB9, 0xB0, 0x04, 0x0B, 0xE1, 0xCC, 0x35, 0x31, 0x84, 0xE6, 0x22, 0xF9, 0xC2, 0xAB,
	0x95, 0x91, 0x61, 0xD9, 0x2B, 0xB9, 0x72, 0x4E, 0x10, 0x76, 0x31, 0x66, 0x0A, 0x0B, 0x2E, 0x83,
};

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

int BitCount(BYTE x)
{
	int n = 0;
	n += ((x >> 7) & 1);
	n += ((x >> 6) & 1);
	n += ((x >> 5) & 1);
	n += ((x >> 4) & 1);
	n += ((x >> 3) & 1);
	n += ((x >> 2) & 1);
	n += ((x >> 1) & 1);
	n += ((x >> 0) & 1);
	return n;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void decode_mmb2(BYTE *p)
{
	if(p[6] == 0xFF && p[7] == 0xFF)	{
		int decode_length = (p[0] << 0) | (p[1] << 8) | (p[2] << 16);
		DWORD key1 = p[5] ^ 0xF0;
		DWORD key2 = key_table2[key1] ;
		int key_counter = 0;

		DWORD decode_count = ((decode_length - 8) & ~0xf) / 2;

		DWORD *data1 = (DWORD *)(p + 8 + 0);
		DWORD *data2 = (DWORD *)(p + 8 + decode_count);
		for(DWORD pos = 0; pos < decode_count; pos += 8)
		{
			if(key2 & 1)
			{
				DWORD tmp;

				tmp = data1[0];
				data1[0] = data2[0];
				data2[0] = tmp;

				tmp = data1[1];
				data1[1] = data2[1];
				data2[1] = tmp;
			}
			key1 += 9;
			key2 += key1;
			data1 += 2;
			data2 += 2;
		}
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void decode_mmb(BYTE*p)
{
	if(p[3] >= 5)
	{
		int decode_length = (p[0] << 0) | (p[1] << 8) | (p[2] << 16);
		DWORD key = key_table[p[5] ^ 0xF0];
		int key_counter = 0;

		for(int pos = 8; pos < decode_length; pos++)
		{
			DWORD x = ((key & 0xFF) << 8) | (key & 0xFF);
			key += ++key_counter;

			p[pos] ^= (x >> (key & 7));
			key += ++key_counter;
		}
	}
	decode_mmb2(p);
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void decode_mzb(BYTE* p)
{
	if (p[3] >= 0x1B)
	{
		int decode_length = (p[0] << 0) | (p[1] << 8) | (p[2] << 16);
		DWORD key = key_table[p[7] ^ 0xFF];
		int key_counter = 0;

		for (int pos = 8; pos < decode_length; )
		{
			int xor_length = ((key >> 4) & 7) + 16;

			if ((key & 1) && (pos + xor_length < decode_length))
			{
				for (int i = 0; i < xor_length; i++)
	 			{
					p[pos+i] ^= 0xFF;
				}
			}
			key += ++key_counter;
			pos += xor_length;
		}
		int node_count = (p[4] << 0) | (p[5] << 8) | (p[6] << 16);
		OBJINFO *node = (OBJINFO *)(p+32);
		for(int i = 0; i < node_count; i++)
		{
			for(int i = 0; i < 16; i++)
			{
				node->id[i] ^= 0x55;
			}
			node++;
		}
	}
}