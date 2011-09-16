//------------------------------------------------------------------------------
//  File: TDWGame.h
//  Desc: ÓÎÏ·µÄD3DäÖÈ¾¿ò¼Ü     
//  Revision history:
//      * 2007/08/10 Created by Muzisoft05@163.com.
//
//  Todo:
//
//------------------------------------------------------------------------------

/*------------------------------------------------------------------------------
    Constant definitions.
------------------------------------------------------------------------------*/
#define DIRECT3D_VERSION         0x0900
#define TDWVersion "Ver 1.0"

#include <d3d9.h>
#include <d3dx9math.h>

extern LPDIRECT3D9	g_pD3D;
extern LPDIRECT3DDEVICE9 g_pD3DDevice;

BOOL InitD3D(HWND hwnd);
void CleanUpD3D(void);

IDirect3DTexture9 *CreatTex(LPSTR dat);