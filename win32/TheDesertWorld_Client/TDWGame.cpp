//------------------------------------------------------------------------------
//  File: TDWGame.cpp
//  Desc: 游戏的D3D渲染框架     
//  Revision history:
//      * 2007/08/10 Created by Muzisoft05@163.com.
//
//  Todo: 打算打成双缓冲
//
//------------------------------------------------------------------------------

#pragma comment(lib,"d3d9")
#pragma comment(lib,"D3dx9")
#pragma comment(lib,"winmm")

#include <d3d9.h>
#include <d3dx9math.h>
#include "TDWGame.h"

/************************************************************************
*																		*
*  D3D8 Stuff															*
*																		*
************************************************************************/

LPDIRECT3D9	g_pD3D = NULL;
LPDIRECT3DDEVICE9 g_pD3DDevice = NULL;
BOOL g_bSetupOK = FALSE;

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

IDirect3DTexture9 *CreatTex(LPSTR dat)
{
	LPDIRECT3DTEXTURE9 pTex = NULL;
	UINT xx,yy;
	xx = *(UINT*)(dat+4);
	yy = *(UINT*)(dat+8);
	D3DLOCKED_RECT rc;
	HRESULT hr;

	if (*(DWORD*)(dat+0x28) == 'DXT3')
	{
		hr = g_pD3DDevice->CreateTexture(xx,yy,0,0 ,D3DFMT_DXT3,D3DPOOL_MANAGED,&pTex,NULL);
		if (hr != D3D_OK) return NULL;

		hr = pTex->LockRect(0,&rc,NULL,0);
		if (hr == D3D_OK)
		{
			CopyMemory(rc.pBits,dat+0x28+12,(xx/4) * (yy/4) * 16 );
			pTex->UnlockRect(0);
		}
		return pTex;
	}

	if (*(DWORD*)(dat+0x28) == 'DXT1')
	{
		hr = g_pD3DDevice->CreateTexture(xx,yy,0,0,D3DFMT_DXT1,D3DPOOL_MANAGED,&pTex,NULL);
		if (hr != D3D_OK) return NULL;

		hr = pTex->LockRect(0,&rc,NULL,0);
		if (hr == D3D_OK)
		{
			CopyMemory(rc.pBits,dat+0x28+12,(xx/4) * (yy/4) * 8  );
			pTex->UnlockRect(0);
		}
		return pTex;
	}

	hr = g_pD3DDevice->CreateTexture(xx,yy,0,0,D3DFMT_A8R8G8B8,D3DPOOL_MANAGED,&pTex,NULL);
	if (hr != D3D_OK) return NULL;

	hr = pTex->LockRect(0,&rc,NULL,0);
	if (hr == D3D_OK)
	{
		for (DWORD jy = 0; jy < yy; ++jy)
		{
			for (DWORD jx = 0; jx < xx; ++jx)
			{
				DWORD *pp  = (DWORD *)rc.pBits;
				BYTE  *idx = (BYTE  *)(dat+0x28+0x400);
				DWORD *pal = (DWORD *)(dat+0x28);
				pp[(yy-jy-1)*xx+jx] = pal[idx[jy*xx+jx]];
			}
		}
		pTex->UnlockRect(0);
	}
	return pTex;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

BOOL InitD3D(HWND hwnd)
{
	HRESULT hr;
	D3DDISPLAYMODE disp_mode;
	D3DPRESENT_PARAMETERS pp;

	if (g_bSetupOK) return TRUE;

	if (g_pD3D) return FALSE;

	g_pD3D = Direct3DCreate9(D3D_SDK_VERSION);
	if (!g_pD3D) return FALSE;
	
	hr = g_pD3D->GetAdapterDisplayMode(D3DADAPTER_DEFAULT, &disp_mode);
	if (FAILED(hr)) 
	{
		g_pD3D->Release();
		g_pD3D = NULL;
		return FALSE;
	}
	
	ZeroMemory(&pp, sizeof(D3DPRESENT_PARAMETERS));
	pp.Windowed = true;
	pp.SwapEffect = D3DSWAPEFFECT_DISCARD;
	pp.BackBufferFormat = disp_mode.Format;
	pp.EnableAutoDepthStencil = TRUE;
	pp.AutoDepthStencilFormat = D3DFMT_D16;
    pp.BackBufferCount = 1;

	BOOL flgSoft = GetPrivateProfileInt("GENERIC","LEVEL",1,".\\TDWGame.ini");

	char buff[256];
	wsprintf(buff,"%d",flgSoft);
	WritePrivateProfileString("GENERIC","LEVEL",buff,".\\TDWGame.ini");

	hr = g_pD3D->CreateDevice(D3DADAPTER_DEFAULT,D3DDEVTYPE_HAL,hwnd,D3DCREATE_HARDWARE_VERTEXPROCESSING,&pp,&g_pD3DDevice);
	if (FAILED(hr))
	{
		hr = g_pD3D->CreateDevice(D3DADAPTER_DEFAULT,D3DDEVTYPE_HAL,hwnd,D3DCREATE_SOFTWARE_VERTEXPROCESSING,&pp,&g_pD3DDevice);
		if (FAILED(hr)) 
		{
			hr = g_pD3D->CreateDevice(D3DADAPTER_DEFAULT,D3DDEVTYPE_REF,hwnd,D3DCREATE_SOFTWARE_VERTEXPROCESSING,&pp,&g_pD3DDevice);
			if (FAILED(hr)) 
			{
				g_pD3D->Release();
				g_pD3D = NULL;
				return FALSE;
			}
		}
	}

	D3DCAPS9 DX9DCaps;
	g_pD3DDevice->GetDeviceCaps(&DX9DCaps);
	g_bSetupOK = TRUE;
	return TRUE;	
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CleanUpD3D()
{
	if (!g_bSetupOK) return;

	if (g_pD3DDevice) 
	{
		g_pD3DDevice->Release();
		g_pD3DDevice = NULL;
	}
	if (g_pD3D) 
	{
		g_pD3D->Release();
		g_pD3D = NULL;
	}

	g_bSetupOK = FALSE;
}
