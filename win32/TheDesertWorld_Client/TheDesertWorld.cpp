//------------------------------------------------------------------------------
//  File: TheDesertWorld.cpp
//  Desc: 程序主入口     
//  Revision history:
//      * 2007/08/10 Created by Muzisoft05@163.com.
//
//  Todo:
//
//------------------------------------------------------------------------------

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mmsystem.h>

#include <string.h>
#include <stdio.h>
#include "TDWAnalysis.h"
#include "TDWGame.h"
#include "TDWCharacter.h"

/*------------------------------------------------------------------------------
Globals
------------------------------------------------------------------------------*/
HWND hwndMain;
HINSTANCE hInst;
LPD3DXFONT pDxFont=NULL;

BOOL flgDebugLog=TRUE;   //是否产生TDWGame.log文件
BOOL flgFirst = FALSE;
BOOL flgSetuping=FALSE;
BOOL flgViewError=FALSE;
BOOL isOK = FALSE;
D3DLIGHT9 light;

/*------------------------------------------------------------------------------
Externs from TDWmap.cpp
------------------------------------------------------------------------------*/
extern int  pory;
extern int noj;
extern int  haha;
extern TEXTEX TexList[4096];
extern LPSTR MMBlist[4096];
extern int NumMMB;
extern int NumTexList;
extern BOOL ImgLoad(DWORD fno);
extern BOOL ImgReadMap(int no); //Map文件的镜像实际读取
extern void DrawMap(void);  
/*------------------------------------------------------------------------------
end externing
------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------
Externs from TDWCharacter.cpp
------------------------------------------------------------------------------*/
extern void DrawCharacter(void);
extern BOOL SetData(int pn,FFXIFile &f);
extern BOOL ImgLoad(int pn,int no, BOOL flgBase);
extern BOOL ImgLoadPC(PC *pc,int pt);
extern BOOL ImgLoadNPC(int no);
extern PCFNO pcf;
extern PC pc;
extern int cngmode;

/*------------------------------------------------------------------------------
end externing
------------------------------------------------------------------------------*/

int imgnomdl = 1300;
int ImgnoMap = 100;  //初始化地图镜像文件,看到ImgnoXXX和ImgReadXXX()的命名规则了吗?


FFXIFile f;
FFXICharacter c;
int hyozino = -1;

//通用log文件输出
void __cdecl logprintf(LPCSTR lpszFormat, ...)
{
  if( !flgDebugLog ) return;
  char szOutput[4096];
  va_list v1;
  DWORD dwSize;

  va_start(v1, lpszFormat);

  dwSize = wvsprintf(szOutput, lpszFormat, v1);

  if (szOutput[dwSize-1] != '\n')
        strcat(szOutput, "\r\n");

  HANDLE hFile = CreateFile(".\\TDWGame.log",GENERIC_WRITE,FILE_SHARE_READ,NULL,
                              OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL );
  if( hFile!=INVALID_HANDLE_VALUE && hFile!=NULL ){
    DWORD dmy;
    SetFilePointer(hFile,0,NULL,FILE_END);
    WriteFile(hFile,szOutput,lstrlen(szOutput),&dmy,NULL);
    CloseHandle(hFile);
  }
}

//sstr
LPSTR sstr(LPSTR str,int n)
{
  static char tmp[256];
  CopyMemory(tmp,str,n); tmp[n]=0;;
  return tmp;
}



//实际的绘制过程
void Draw(void)
{
	if( !isOK ) return;
	char buff[256];

	RECT rc={40,200,600,400};
	GetClientRect(hwndMain,&rc); rc.top+=(rc.bottom-rc.top)/3;

	if( flgViewError )
	{
		g_pD3DDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(128,0,0), 1.0f, 0L );
		g_pD3DDevice->BeginScene();
		wsprintf(buff,"开始绘制..\n因为以前某次运行到这里失败,所以这次也不尝试绘制");
		pDxFont->DrawTextA(NULL, buff, lstrlen(buff), &rc, DT_CENTER,  D3DCOLOR_XRGB(255,255,0)); 
		g_pD3DDevice->EndScene();
		g_pD3DDevice->Present( NULL, NULL, NULL, NULL ); 
		return;
	}
	if( f.IsNull() )
	{
		g_pD3DDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0,0,0), 1.0f, 0L );
		g_pD3DDevice->BeginScene();
		wsprintf(buff,"偙偺斣崋偺儅僢僾偼偁傝傑偣傫丅");
		pDxFont->DrawTextA(NULL, buff, lstrlen(buff), &rc, DT_CENTER,  D3DCOLOR_XRGB(255,255,255)); 
		g_pD3DDevice->EndScene();
		g_pD3DDevice->Present( NULL, NULL, NULL, NULL ); 
		return;
	}
   
	//画地图
	g_pD3DDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(255,255,192), 1.0f, 0L );
	DrawMap();
   
	//画人物
	// DrawCharacter();
   g_pD3DDevice->Present( NULL, NULL, NULL, NULL );
}

BOOL CALLBACK BangouDlgProc( HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam )
{
  switch(uMsg)
  {
    case WM_INITDIALOG:
      SetFocus(hWnd);
      break;
    case WM_COMMAND:
      if( LOWORD(wParam)==IDCANCEL ){
        EndDialog(hWnd,FALSE);
        return TRUE;
      }else
      if( LOWORD(wParam)==IDOK ){
        DWORD du; BOOL flg;
        du = GetDlgItemInt(hWnd,100,&flg,FALSE);

          haha=du;

        //  EndDialog(hWnd,TRUE);
          return TRUE;
      }
      break;

	  case WM_DESTROY:
      //
      break;

  }
  
  return FALSE;
}

LRESULT CALLBACK WndProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	switch (uMsg) {
    case WM_CREATE:
      break;
	case WM_COMMAND:
      if( LOWORD(wParam)==200){
        DialogBox(hInst,"BANGOU",hWnd,(DLGPROC)BangouDlgProc);
	  }
	  break;
    case WM_KEYDOWN:
		/*
	 if( wParam==VK_SPACE ){//只有space键换地图
	  do{
        ImgnoMap++; if(ImgnoMap>=700) ImgnoMap = 100;
	  } while(!ImgReadMap(ImgnoMap));
		}
	  if( '1'<=wParam && wParam<='8' ){
        pc.syuzoku = wParam - '1';
        ImgLoadPC(&pc,-1);
      }
      if( pc.syuzoku!=-1 && VK_F1<=wParam && wParam<=VK_F7 ){
        cngmode = wParam-VK_F1+1;
      }
      if( wParam=='9'||wParam=='0' ){
        cngmode = 0; pc.syuzoku=-1;
        ImgLoadNPC(imgnomdl);
      }
      if(cngmode>0&&cngmode<8){
        int tugi = 0;
	    if (haha>=noj-1 || haha<0) haha = 0;
        if( wParam==VK_ADD )  haha++;//if (haha==NumMMB-1) haha = 0;
	  //else haha++;
        if( wParam==VK_SUBTRACT ) haha--;
        if( GetKeyState(VK_CONTROL)&0x8000 ) tugi*=64;
        if(tugi){
          if(cngmode==1){pc.facetype+=tugi;pc.facetype&=0xf;}
          if(cngmode==2){pc.head+=tugi;    pc.head&=0xff;}
          if(cngmode==3){pc.body+=tugi;    pc.body&=0xff;}
          if(cngmode==4){pc.hands+=tugi;   pc.hands&=0xff;}
          if(cngmode==5){pc.waist+=tugi;   pc.waist&=0xff;}
          if(cngmode==6){pc.legs+=tugi;    pc.legs&=0xff;}
          if(cngmode==7){pc.buki+=tugi;   }
          if(pc.buki<0) pc.buki=1280-1;
          if(pc.buki>=1280) pc.buki=0;
          ImgLoadPC(&pc,cngmode);
        }
        break;
      }
      {
        int tugi = 0;
        int re = 128;
        if( wParam==VK_ADD ){
          if( GetKeyState(VK_CONTROL)&0x8000 ){ tugi = 100; re=1; }
          else                                  tugi = 1;
        }
        if( wParam==VK_SUBTRACT ){
          if( GetKeyState(VK_CONTROL)&0x8000 ){ tugi =-100; re=1; }
          else                                  tugi =-1; 
        }
        while(tugi&&re>0){
          imgnomdl+=tugi;
          //斖埻偼1300-2799
          if(tugi>0){
            if( imgnomdl>2799 ) imgnomdl = 1300;
          }else{
            if( imgnomdl<1300 ) imgnomdl = 2799;
          }
          ImgLoadNPC(imgnomdl);
          if(c.IsEnable()) break;
          re--;
        }
      }
	  */
      break;
    case WM_NCMOUSEMOVE:
      hyozino = -1;
			return DefWindowProc(hWnd, uMsg, wParam, lParam);
#ifdef _DEBUG
    case WM_MOUSEMOVE:
      {
        hyozino = -1;
        int x = LOWORD(lParam);
        int y = HIWORD(lParam);
        for(;;){
          if(x<0||x>40||y<0) break;
          if((y%40)>14) break;
          hyozino = y/40;
          break;
        }
      }
			return DefWindowProc(hWnd, uMsg, wParam, lParam);
      break;
#endif
    case WM_PAINT:
      {
        PAINTSTRUCT ps;
        BeginPaint(hWnd,&ps);
        EndPaint(hWnd,&ps);
      }
      break;
	case WM_DESTROY:
      isOK = FALSE;
			PostQuitMessage(0);
		break;

		default:
			return DefWindowProc(hWnd, uMsg, wParam, lParam);
	}
	return 0L;
}



int WINAPI WinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPSTR lpCmdLine,int nCmdShow)
{
	WNDCLASS wc;
	MSG msg;
	
	hInst = hInstance;

	LocateFFXIDataFolder(); //ffxidir偵僼僅儖僟乕柤偑僙僢僩偝傟傑偡丅

	isOK = FALSE;

	wc.style = 0;
	wc.lpfnWndProc = (WNDPROC)WndProc;
	wc.cbClsExtra = 0;
	wc.cbWndExtra = 0;
	wc.hInstance = hInst;
	wc.hIcon = LoadIcon(hInst,"Main");
	wc.hCursor = LoadCursor(NULL, IDC_ARROW);
	wc.hbrBackground = (HBRUSH)GetStockObject(BLACK_BRUSH);
	wc.lpszMenuName = NULL;
	wc.lpszClassName = "TDWGame";

	if (!RegisterClass(&wc)) 
	{
		MessageBox(0, "RegisterClass failed", "error", MB_OK | MB_ICONEXCLAMATION);
		exit(1);
	}
	hwndMain = CreateWindow(
		"TDWGame",
		"对不起,DX8加载失败!",
		WS_OVERLAPPEDWINDOW,
		CW_USEDEFAULT, CW_USEDEFAULT,
		1024, 768,
		NULL,
		NULL,
		hInstance,
		NULL
	);
	if (!hwndMain) return FALSE;

	if (InitD3D(hwndMain)) 
	{
		//D3DXCreateFont(g_pD3DDevice,(HFONT)GetStockObject(SYSTEM_FONT),&pDxFont);
		D3DXCreateFont(g_pD3DDevice, 30, 10, FW_NORMAL, 0, false, 1, 0, 0, DEFAULT_PITCH|FF_MODERN, "Arial", &pDxFont);

		isOK = TRUE;
		ZeroMemory( &light, sizeof(light) );
		light.Type = D3DLIGHT_DIRECTIONAL;
		light.Diffuse.r = 1.0f;
		light.Diffuse.g = 1.0f;
		light.Diffuse.b = 1.0f;
		light.Ambient.r = 1.0f;
		light.Ambient.g = 1.0f;
		light.Ambient.b = 1.0f;

		D3DXVECTOR3 vector;
		vector = D3DXVECTOR3(0.0f,1.0f,2.0f);

		D3DXVec3Normalize((D3DXVECTOR3*)&light.Direction,&vector);
		ImgnoMap = GetPrivateProfileInt("GENERIC","LASTMAP",101,".\\TDWGame.ini");

		ImgLoadPC(&pc,-1);
		ImgReadMap(ImgnoMap);
    }
	else
	{
		MessageBox(0, "DirectX9加载失败(- -),请把TDWGame.ini中的Level改为3试试.", "error", MB_OK | MB_ICONEXCLAMATION);
	}
	ShowWindow(hwndMain, nCmdShow);
	UpdateWindow(hwndMain);
	SetFocus(hwndMain);

	DWORD dw = 0;

	while (true)
	{
		if (PeekMessage(&msg, NULL, 0, 0, PM_NOREMOVE)) 
		{
			if (!GetMessage(&msg, NULL, 0, 0)) break;
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}else{
			DWORD dwT = timeGetTime();
			if (dwT-dw >= (1000/30))
			{ 
				Draw(); 
				dw = dwT; 
			}else{ 
				dwT -= dw; 
				if(dwT > 5)
				{ 
					Sleep(dwT-4); 
				} 
			}
		}
		Sleep(1);
	}

	for (int i = 0; i < NumTexList; ++i)
	{
		if (TexList[i].pTex)
		{
			TexList[i].pTex->Release();
		}
	}
	if (pDxFont)
	{
		pDxFont->Release();
		pDxFont = NULL;
	}
	CleanUpD3D();
	return msg.wParam;
}

