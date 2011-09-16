//------------------------------------------------------------------------------
//  File: TDWMap.cpp
//  Desc: ffxi的地图单元     
//  Revision history:
//      * 2007/08/10 Created by Muzisoft05@163.com.
//
//  Todo:
//
//------------------------------------------------------------------------------

#include "TDWAnalysis.h"
#include "TDWGame.h"

TEXTEX TexList[4096];
LPSTR MMBlist[4096];
int NumMMB = 0;
int NumTexList=0;
int haha = 0;

BOOL AutoMakeMMB = false;

//extern from The DersertWorld.cpp
extern LPD3DXFONT pDxFont;
extern HWND hwndMain;
extern int flgViewError;
extern BOOL flgFirst;
extern void __cdecl logprintf(LPCSTR lpszFormat, ...);
extern LPSTR sstr(LPSTR str,int n);
extern FFXIFile f;
extern int ImgnoMap;

//end externing

OBJINFO *oj;
int noj;

int  pory = 0;

//设置观看矩阵
void SetupViewMatrixMap(void)
{
 

}

BOOL DoesFileExist(PTSTR pszFile)
{
    HANDLE		hFile = NULL ;
    //
    // We don't want any error message box to pop up when
    // we try to test if the required file is available to
    // open for read.
    //
    UINT uErrorMode = SetErrorMode(SEM_FAILCRITICALERRORS | 
     SEM_NOOPENFILEERRORBOX);
    hFile = CreateFile(pszFile, GENERIC_READ, 
					    FILE_SHARE_READ, NULL, 
    OPEN_EXISTING, FILE_FLAG_SEQUENTIAL_SCAN,
    NULL);
    SetErrorMode(uErrorMode);  // restore error mode
    if (INVALID_HANDLE_VALUE  == hFile) 
    return FALSE ;		

    CloseHandle(hFile);
    return TRUE;
}

//去掉一个由char组成的str的空格
//形参用*最好，因为可同时改变传入的str,不需要返回一个新的str
void ChangeSpaceToNull(char *pszData)
{
	char *pszCheck = pszData;

	while (*pszCheck)
	{
		if (*pszCheck == 0x20)
		{
			*pszCheck = '\0';
			break;
		}

		pszCheck++;
	}
}

BOOL AddList(LPSTR p)
{
  CopyMemory(TexList[NumTexList].ID,p+1,16); TexList[NumTexList].ID[16]=0;
  TexList[NumTexList].pTex = CreatTex(p+1+16);
  if( TexList[NumTexList].pTex ){
    NumTexList++;
    if( NumTexList>=sizeof(TexList)/sizeof(TexList[0]) ){
      logprintf("NumTextList偑椪奅揰偵払偟傑偟偨");
    }
    return TRUE;
  }
  return FALSE;
}

//通用镜像载入,可直接用来加载地图
//因为Map和Img这二个词都可以表示镜像,这里以Img作为镜像,Map用来表示地图的含义
BOOL ImgLoad(DWORD fno)
{
  char buff[256];

//作用就相当于GetFileNameFromFileID(filename,fno)，仅仅根据一个文件号得出一个文件名
//extern BOOL ImgReadXXX(int no);才是真正的镜像读取,比如ImgReadMap()
//FileID没用被使用，作为GetFileNameFromFileID()的中间过程被丢弃
//该文件号就是memo分析文档的最后一个版块file table number
  if( !f.Load(fno) ){
    wsprintf(buff,"The Desert World %s FileNo:%d ",TDWVersion,fno);
    SetWindowText(hwndMain,buff);
    return FALSE;
  }

  wsprintf(buff,"The Desert World %s FileNo:%d %s ",TDWVersion,fno,f.GetShortFilename());
  SetWindowText(hwndMain,buff);
  wsprintf(buff,"map%d",fno);
  flgViewError = GetPrivateProfileInt("MAPERROR",buff,0,".\\TDWGame.ini");
  flgFirst=TRUE;
  return TRUE;
}

//这里才是镜像文件的实际读取
BOOL ImgReadMap(int no)
{	
	char buff[256];
	RECT rc={40,200,600,400};

	g_pD3DDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0,128,0), 1.0f, 0L );
	g_pD3DDevice->BeginScene();
	GetClientRect(hwndMain,&rc); rc.top+=(rc.bottom-rc.top)/3;
	wsprintf(buff,"僼傽僀儖傪撉傒崬傫偱偄傑偡丅");
	pDxFont->DrawTextA(NULL, buff,lstrlen(buff),&rc, DT_CENTER,  D3DCOLOR_XRGB(0,255,255));
	g_pD3DDevice->EndScene();
	g_pD3DDevice->Present( NULL, NULL, NULL, NULL ); 

	for (int i = 0; i < NumTexList; ++i)
	{
		if (TexList[i].pTex)
		{
			TexList[i].pTex->Release();
			TexList[i].pTex = NULL;
		}
	}

	NumTexList = 0;
	NumMMB = 0;
	noj = 0;
	oj = NULL;

	if( !ImgLoad(no) ) return FALSE;

	g_pD3DDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0,128,0), 1.0f, 0L );
	g_pD3DDevice->BeginScene();
	rc.top+=16;
	wsprintf(buff,"妋擣偟偰偄傑偡丅");
	pDxFont->DrawTextA(NULL, buff,lstrlen(buff),&rc, DT_CENTER,  D3DCOLOR_XRGB(0,255,255)); 
	g_pD3DDevice->EndScene();
	g_pD3DDevice->Present( NULL, NULL, NULL, NULL ); 

	char *p;
	DATHEAD hd;
	for( p=f.FistData(&hd); p; p=f.NextData(&hd) )
	{
		int type = (int)hd.type;

		switch (type)
		{
			case 0x1c:  //MZB
			{
				decode_mzb((BYTE*)(p+16));
				oj =  (OBJINFO *)(p+16+32);
				noj = (*(int*)(p+16+4) )&0xffffff;
			}
			break;
			case 0x2e:  //MMB
			{
				decode_mmb((BYTE*)(p+16));
				MMBlist[NumMMB++] = p+16;
				if( NumMMB >= sizeof(MMBlist)/sizeof(MMBlist[0]) )
				{
					logprintf("NumTextList偑椪奅揰偵払偟傑偟偨");
				}
			}
			break;
			case 0x20:  //IMG
			{
				if( IsImg(p+16) )
				{
					AddList(p+16);
				}
			}
			break;
		}
	}

	wsprintf(buff,"%d",no);
	WritePrivateProfileString("GENERIC","LASTMAP" ,buff,".\\TDWGame.ini");
	g_pD3DDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0,128,0), 1.0f, 0L );
	g_pD3DDevice->BeginScene();
	rc.top+=16;
	wsprintf(buff,"撉傒崬傒傪廔椆偟傑偟偨丅昤夋偟傑偡丅\n偙偙偱傾僾儕働乕僔儑儞僄儔乕弌偨応崌偼師夞昤夋偝傟傑偣傫丅");
	pDxFont->DrawTextA(NULL,buff,lstrlen(buff),&rc, DT_CENTER,  D3DCOLOR_XRGB(0,255,255));
	g_pD3DDevice->EndScene();
	g_pD3DDevice->Present( NULL, NULL, NULL, NULL ); 
	return TRUE;
}

void DrawMMB(char *pp)
{
  float *ff = (float*)pp;

  char *p = pp;
  p+=0x020;
	for(;;)
	{
		OOO * oo;
		oo = (OOO*)(p+4);
		D3DXMATRIX mat;
		D3DXMATRIX mat1;
		g_pD3DDevice->GetTransform(D3DTS_WORLD, &mat1); mat = mat1;
		g_pD3DDevice->GetTransform(D3DTS_VIEW, &mat1); mat *= mat1;
		g_pD3DDevice->GetTransform(D3DTS_PROJECTION, &mat1); mat *= mat1;
		D3DXVECTOR3 Vec;
		D3DXVECTOR4 v;
		Vec.x=oo->x1;Vec.y=oo->y1;Vec.z=oo->z1; D3DXVec3Transform(&v,&Vec,&mat); v.x/=v.w; v.y/=v.w; v.z/=v.w;
		if( v.x<=2.2 && v.x>=-2.2 && v.y<=2.2 && v.y>=-2.2 && v.z<=2.2 && v.z>=-1.2 ) break;
		Vec.x=oo->x1;Vec.y=oo->y1;Vec.z=oo->z2; D3DXVec3Transform(&v,&Vec,&mat); v.x/=v.w; v.y/=v.w; v.z/=v.w;
		if( v.x<=2.2 && v.x>=-2.2 && v.y<=2.2 && v.y>=-2.2 && v.z<=2.2 && v.z>=-1.2 ) break;
		Vec.x=oo->x1;Vec.y=oo->y2;Vec.z=oo->z1; D3DXVec3Transform(&v,&Vec,&mat); v.x/=v.w; v.y/=v.w; v.z/=v.w;
		if( v.x<=2.2 && v.x>=-2.2 && v.y<=2.2 && v.y>=-2.2 && v.z<=2.2 && v.z>=-1.2 ) break;
		Vec.x=oo->x1;Vec.y=oo->y2;Vec.z=oo->z2; D3DXVec3Transform(&v,&Vec,&mat); v.x/=v.w; v.y/=v.w; v.z/=v.w;
		if( v.x<=2.2 && v.x>=-2.2 && v.y<=2.2 && v.y>=-2.2 && v.z<=2.2 && v.z>=-1.2 ) break;
		Vec.x=oo->x2;Vec.y=oo->y1;Vec.z=oo->z1; D3DXVec3Transform(&v,&Vec,&mat); v.x/=v.w; v.y/=v.w; v.z/=v.w;
		if( v.x<=2.2 && v.x>=-2.2 && v.y<=2.2 && v.y>=-2.2 && v.z<=2.2 && v.z>=-1.2 ) break;
		Vec.x=oo->x2;Vec.y=oo->y1;Vec.z=oo->z2; D3DXVec3Transform(&v,&Vec,&mat); v.x/=v.w; v.y/=v.w; v.z/=v.w;
		if( v.x<=2.2 && v.x>=-2.2 && v.y<=2.2 && v.y>=-2.2 && v.z<=2.2 && v.z>=-1.2 ) break;
		Vec.x=oo->x2;Vec.y=oo->y2;Vec.z=oo->z1; D3DXVec3Transform(&v,&Vec,&mat); v.x/=v.w; v.y/=v.w; v.z/=v.w;
		if( v.x<=2.2 && v.x>=-2.2 && v.y<=2.2 && v.y>=-2.2 && v.z<=2.2 && v.z>=-1.2 ) break;
		Vec.x=oo->x2;Vec.y=oo->y2;Vec.z=oo->z2; D3DXVec3Transform(&v,&Vec,&mat); v.x/=v.w; v.y/=v.w; v.z/=v.w;
		if( v.x<=2.2 && v.x>=-2.2 && v.y<=2.2 && v.y>=-2.2 && v.z<=2.2 && v.z>=-1.2 ) break;
    return;
    if(0)
	{
      //float pp[]={-20,0,0,20,0,0, 0,-20,0,0,20,0, 0,0,-20,0,0,20};
      float pp[]={
        oo->x1,oo->y1,oo->z1, oo->x2,oo->y1,oo->z1,
        oo->x1,oo->y2,oo->z1, oo->x2,oo->y2,oo->z1,
        oo->x1,oo->y1,oo->z2, oo->x2,oo->y1,oo->z2,
        oo->x1,oo->y2,oo->z2, oo->x2,oo->y2,oo->z2,

        oo->x1,oo->y1,oo->z1, oo->x1,oo->y2,oo->z1,
        oo->x2,oo->y1,oo->z1, oo->x2,oo->y2,oo->z1,
        oo->x1,oo->y1,oo->z2, oo->x1,oo->y2,oo->z2,
        oo->x2,oo->y1,oo->z2, oo->x2,oo->y2,oo->z2,

        oo->x1,oo->y1,oo->z1, oo->x1,oo->y1,oo->z2,
        oo->x1,oo->y2,oo->z1, oo->x1,oo->y2,oo->z2,
        oo->x2,oo->y1,oo->z1, oo->x2,oo->y1,oo->z2,
        oo->x2,oo->y2,oo->z1, oo->x2,oo->y2,oo->z2,
      };
      g_pD3DDevice->SetFVF(D3DFVF_XYZ);
      g_pD3DDevice->DrawPrimitiveUP(D3DPT_LINELIST,12,pp,12);
    }
  }
  g_pD3DDevice->SetFVF(D3DFVF_TEXVERTEX);
  int kai;
  //while( (kai=*(int*)p)<=0 ) p+=32;
  kai=*(int*)p;
  if( flgFirst ) logprintf("kai=%d",kai);
  if( kai<=0 ) return;
  if( kai==1 ) p+=32;
  if( kai>=2 && kai<=16 ){
    p+=16*4;
  }
  if( kai>16 )  p+=kai*4;

  if( kai>0xff ) return;
  if( kai>64 ){
         MessageBox(NULL,"傢偍","傢偍",MB_OK);
  }
  int i,j;
  while(kai){
    j = *(int*)p;
    if( j > 0xffff || j<0 ){
      if( flgFirst ) logprintf("Strip越界: %d",j);
      return;
    }
    p += 32;
    for( i=0; i<j; i++ ){


    //draw using textures hint
  {
	char buff[512];
    RECT rc={5,177,600,292}; rc.top+=i*40;
    sprintf(buff,"Serch Textur: %s",sstr(p,16));
	//如何把buff分段呢
    pDxFont->DrawTextA(NULL,buff,lstrlen(buff),&rc, DT_LEFT,  D3DCOLOR_XRGB(196,196,0)); 
  }
      g_pD3DDevice->SetRenderState(D3DRS_ALPHABLENDENABLE, FALSE);
      g_pD3DDevice->SetRenderState(D3DRS_ALPHATESTENABLE, FALSE);

      g_pD3DDevice->SetTextureStageState(0, D3DTSS_COLOROP, D3DTOP_SELECTARG1);
      g_pD3DDevice->SetTextureStageState(0, D3DTSS_COLORARG1, D3DTA_DIFFUSE);
      g_pD3DDevice->SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_SELECTARG1 );
      g_pD3DDevice->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_DIFFUSE);

      //g_pD3DDevice->SetTextureStageState(0, D3DTSS_MAGFILTER, D3DTEXF_LINEAR );
      //g_pD3DDevice->SetTextureStageState(0, D3DTSS_MINFILTER, D3DTEXF_LINEAR);
      //g_pD3DDevice->SetTextureStageState(0, D3DTSS_MIPFILTER, D3DTEXF_LINEAR);
	  int k;
      for( k=0; k<NumTexList; k++ ){
        if( !memcmp(p,TexList[k].ID,16) ){

          if( flgFirst ) logprintf("Finded Textur: %s",sstr(TexList[k].ID,16));

          g_pD3DDevice->SetTexture(0, TexList[k].pTex); 
          g_pD3DDevice->SetTextureStageState(0, D3DTSS_COLOROP, D3DTOP_MODULATE2X);
          g_pD3DDevice->SetTextureStageState(0, D3DTSS_COLORARG1, D3DTA_DIFFUSE);
          g_pD3DDevice->SetTextureStageState(0, D3DTSS_COLORARG2, D3DTA_TEXTURE);
          D3DSURFACE_DESC Desc;

          TexList[k].pTex->GetLevelDesc( 0, &Desc );
          if( /*Desc.Format == D3DFMT_DXT1*/0 ){
            //g_pD3DDevice->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
            g_pD3DDevice->SetRenderState(D3DRS_ALPHABLENDENABLE, TRUE);
            //typedef enum _D3DTEXTUREOP
            //g_pD3DDevice->SetRenderState( D3DRS_ALPHAREF,0x7f) ;
            //g_pD3DDevice->SetRenderState( D3DRS_ALPHAFUNC,D3DCMP_NOTEQUAL) ;
            g_pD3DDevice->SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_MODULATE4X );
            g_pD3DDevice->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_DIFFUSE);
            g_pD3DDevice->SetTextureStageState(0, D3DTSS_ALPHAARG2, D3DTA_TEXTURE);

            g_pD3DDevice->SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
            g_pD3DDevice->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA); 
             g_pD3DDevice->SetRenderState( D3DRS_ALPHATESTENABLE, TRUE );          }
          break;
        }
      }
      int nVer     = (int)*(short*)(p+16);
      int nVerReal = (int)*(int*)(p+16);
      if( nVer > 0xffff || nVer<0 ){
        if( flgFirst ) logprintf("MaxVertex is : %d (%lx)",nVer,nVer);
        return;
      }
      int nIdx = (*(int*)(p+16+4+nVer*36));
      if( nIdx > 0xffff || nIdx < 0 ){
        if( flgFirst ) logprintf("MaxIndex is : %d (%lx)",nIdx,nIdx);
        return;
      }
      k = 16  +    4+ nVer*36+    4+ nIdx*2;
      k = 4*((k+3)/4);
      /*
      if( pdat+dwSize < p+k ){
        if( flgFirst ) logprintf("Size Over Flow");
        return;
      }
      */
      for( int ii=0; ii<nIdx; ii++ ){
        WORD *pidx = (WORD*)(p+16+4+nVer*36+4);
        if( (int)(UINT)pidx[ii]>=nVer ){
          if( flgFirst ) logprintf("Index 越界: %d/%d",(int)(UINT)pidx[ii],nVer);
          return;
        }
      }
      //if( flgFirst ) logprintf("DrawPrimitive: pp=%lx Vertex=%d Index=%d",p-pdat,nVer,nIdx);
#ifdef _DEBUG
      /*
      if(p-pdat==7505268){
        D3DTEXVERTEX *d =  (D3DTEXVERTEX *)(p+16+4);
        for( int ppp=0; ppp<nVer; ppp++ ){
          d[ppp].x = d[ppp].x;
        }
        for( int iii=0; iii<nIdx; iii++ ){
          WORD *pidx = (WORD*)(p+16+4+nVer*36+4);
      //    pidx[iii]= 0;
        }
      }
      */
#endif
//      if( nVerReal>0 ){
#if 1
        g_pD3DDevice->BeginScene();
        pory += nIdx-2;

        g_pD3DDevice->DrawIndexedPrimitiveUP(D3DPT_TRIANGLESTRIP,0,nIdx,nIdx-2,p+16+4+nVer*36+4,D3DFMT_INDEX16, (p+16+4) ,36 );
        if( flgFirst ) logprintf("DrawPrimitive:ok");
        g_pD3DDevice->EndScene();
#else
          g_pD3DDevice->BeginScene();
        for(DWORD cp=0; cp<nIdx-2; cp+=102){
          DWORD cpp = 102;
          if( cp+cpp>=nIdx-2 ){
            cpp = nIdx-2-cp;
          }
          //g_pD3DDevice->DrawIndexedPrimitiveUP(D3DPT_TRIANGLESTRIP,0,cpp+2,cpp,p+16+4+nVer*36+4+cp*2,D3DFMT_INDEX16, (p+16+4) ,36 );
          //g_pD3DDevice->DrawIndexedPrimitiveUP(D3DPT_TRIANGLESTRIP,cp,cpp+2,cpp,p+16+4+nVer*36+4,D3DFMT_INDEX16, (p+16+4) ,36 );
          g_pD3DDevice->DrawIndexedPrimitiveUP(D3DPT_TRIANGLESTRIP,cp,nIdx,cpp,p+16+4+nVer*36+4,D3DFMT_INDEX16, (p+16+4) ,36 );
          if( flgFirst ) logprintf("DrawPrimitive:ok");
        }
        if( flgFirst ) logprintf("DrawPrimitive:ok");
        g_pD3DDevice->EndScene();
#endif
//      }
      g_pD3DDevice->SetTexture(0,NULL); 
      p += k;
    }
    kai--;
  }
}

void DrawMap(void)
{

  char buff[512];
	
  /*------------------------------------------------------------------------------
  //Begin Input Ctrl & View Matrix Setup
  ------------------------------------------------------------------------------*/
  static float angle = 0.0f;
  static float view = -240.0f;
  //view = -view;
  D3DXMATRIX matWorld;
  D3DXMATRIX matWorld2;
  D3DXMatrixTranslation(&matWorld2,0.0f,0.0f,angle/1500.0f);
  //D3DXMatrixRotationX(&matWorld, DEGtoRAD(angle/1.0069));
  //DXMatrixRotationY(&matWorld, DEGtoRAD(angle));
  D3DXMatrixRotationYawPitchRoll(&matWorld,DEGtoRAD(angle/20.0f),DEGtoRAD(angle/15.0f),DEGtoRAD(angle/10.0f));
  matWorld*=matWorld2;
  angle += 1.0f;
  //g_pD3DDevice->SetTransform(D3DTS_WORLD, &matWorld);

  D3DXMATRIX matView;
  static float mawari = 0.0f;
  float delta;
  delta = 0.02f;
  if( GetKeyState(VK_CONTROL)&0x8000 ){ delta = 0.1f; };
  if( GetKeyState(VK_RIGHT) & 0x8000 ) mawari-=delta;
  if( GetKeyState(VK_LEFT)  & 0x8000 ) mawari+=delta;
  static D3DXVECTOR3 pos(0.0f, 0.0f, 0.0f);
  delta = 2.0f;
  if( GetKeyState(VK_CONTROL)&0x8000 ){ delta = 5.0f; };
  if( GetKeyState(VK_UP)    & 0x8000 ){ pos.x+=cos(mawari)*delta; pos.z+=sin(mawari)*delta; }
  if( GetKeyState(VK_DOWN)  & 0x8000 ){ pos.x+=cos(mawari+3.1415926f)*delta; pos.z+=sin(mawari+3.1415926f)*delta; }
  if( GetKeyState(VK_PRIOR) & 0x8000 ){ pos.y+=delta; }
  if( GetKeyState(VK_NEXT)  & 0x8000 ){ pos.y-=delta; }
  if( GetKeyState(VK_HOME)  & 0x8000 ){ mawari=pos.x=pos.y=pos.z=0.0f; }
  D3DXVECTOR3 pnt(pos.x+cos(mawari), pos.y+0.0f, pos.z+sin(mawari));
  D3DXVECTOR3 up(0.0f, 1.0f, 0.0f);
  D3DXMatrixLookAtRH(&matView, &pos, &pnt, &up);
  g_pD3DDevice->SetTransform(D3DTS_VIEW, &matView); 

  D3DXMATRIX matProj;
  D3DXMatrixPerspectiveFovRH(&matProj, DEGtoRAD(45.0f), 4.0f / 3.0f, 1.0f, 500.0f);
  g_pD3DDevice->SetTransform(D3DTS_PROJECTION, &matProj);


   if( GetAsyncKeyState(VK_RETURN)  & 0x1 ){ AutoMakeMMB=TRUE;}


  /*------------------------------------------------------------------------------
  //End Input Ctrl & View Matrix Setup
  ------------------------------------------------------------------------------*/

  /*------------------------------------------------------------------------------
  //Begin RenderState
  ------------------------------------------------------------------------------*/
  //g_pD3DDevice->SetRenderState( D3DRS_CULLMODE,   D3DCULL_CW/*/D3DCULL_NONE*/  );
  g_pD3DDevice->SetRenderState( D3DRS_CULLMODE,   D3DCULL_CCW/*/D3DCULL_NONE*/  );
  g_pD3DDevice->SetRenderState( D3DRS_ZENABLE, TRUE );
  //g_pD3DDevice->SetLight(0,&light);
  //g_pD3DDevice->LightEnable(0,TRUE);
  g_pD3DDevice->SetRenderState(D3DRS_LIGHTING,FALSE);
  //g_pD3DDevice->SetRenderState(D3DRS_AMBIENT, 0xF0F0F0F0);
  g_pD3DDevice->SetRenderState(D3DRS_SHADEMODE, D3DSHADE_GOURAUD );

  g_pD3DDevice->SetRenderState(D3DRS_ALPHABLENDENABLE, TRUE);
  g_pD3DDevice->SetRenderState( D3DRS_STENCILENABLE, TRUE );
  g_pD3DDevice->SetRenderState( D3DRS_ALPHATESTENABLE , TRUE );
  g_pD3DDevice->SetRenderState( D3DRS_ALPHAREF , 0x80 );
  g_pD3DDevice->SetRenderState( D3DRS_ALPHAFUNC  , D3DCMP_GREATER );
  //g_pD3DDevice->SetRenderState(D3DRS_EDGEANTIALIAS,TRUE);
  /*------------------------------------------------------------------------------
  //End RenderState
  ------------------------------------------------------------------------------*/

  //地图是在TheDesertWorld.cpp里画的
  //g_pD3DDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0,0,128), 1.0f, 0L );



  if( flgFirst ) logprintf("MZB:%d",noj);
  pory = 0;
  for( int i=0; i< noj; i++ )
  {
    //if(i>=50) break;
    D3DXMATRIX matWorld;
    D3DXMATRIX matWorld2;
    D3DXMATRIX matWorld3;
    D3DXMATRIX matWorld4;
    D3DXMATRIX matWorldR4;
    D3DXMATRIX matWorldR5;
    D3DXMATRIX matWorldR6;
    ZeroMemory(&matWorld,sizeof(D3DXMATRIX));
    D3DXMatrixScaling(&matWorld3,oj[i].fScaleX,oj[i].fScaleY,oj[i].fScaleZ); 
    D3DXMatrixTranslation(&matWorld,oj[i].fTransX,oj[i].fTransY,oj[i].fTransZ);
    D3DXMatrixRotationX(&matWorldR4,oj[i].fRotX);
    D3DXMatrixRotationY(&matWorldR5,oj[i].fRotY);
    D3DXMatrixRotationZ(&matWorldR6,oj[i].fRotZ);
    matWorld2 = matWorldR4 * matWorldR5 * matWorldR6;
    matWorld=((matWorld3*matWorld2)/**matWorld4*/)*matWorld;
    g_pD3DDevice->SetTransform(D3DTS_WORLD, &matWorld);
    if( oj[i].fScaleX*oj[i].fScaleY*oj[i].fScaleZ < 0.0f )
	{ 
      g_pD3DDevice->SetRenderState( D3DRS_CULLMODE,   D3DCULL_CW );
    }
	else
	{
      g_pD3DDevice->SetRenderState( D3DRS_CULLMODE,   D3DCULL_CCW );
    }
    if(0)
	{
       float pp[]={-20,0,0,20,0,0, 0,-20,0,0,20,0, 0,0,-20,0,0,20};
       //float pp[]={-10,0,0,10,0,0, 0,-10,0,0,10,0, 0,0,-10,0,0,10};
       g_pD3DDevice->SetFVF(D3DFVF_XYZ);
       g_pD3DDevice->DrawPrimitiveUP(D3DPT_LINELIST,3,pp,12);
    }



	//Draw MzbLists Hint
	{
    RECT rc={5,91,600,128};

	  //自动输出
	  i = haha; //这个会打乱文件名和文件内容的正确配对吗?
	  if (AutoMakeMMB == TRUE) {haha+=1;};
      if (haha == (noj -1)) {haha = 0;AutoMakeMMB == false;};

    sprintf(buff,"-----MZBList:%d/%d",i,noj);
    pDxFont->DrawTextA(NULL,buff,lstrlen(buff),&rc, DT_LEFT,  D3DCOLOR_XRGB(0,0,255)); 
	}


    for( int j=0; j< NumMMB; j++ )
	{
      if( memcmp(MMBlist[j]+16,oj[i].id,16) ) continue;

	//Draw Mmb Hint
	{
    RECT rc={5,134,600,160};
    sprintf(buff,"------- Draw MMB:%s",sstr(oj[i].id,16));
    pDxFont->DrawTextA(NULL,buff,lstrlen(buff),&rc, DT_LEFT,  D3DCOLOR_XRGB(0,0,255)); 
	}

    /*------------------------------------------------------------------------------
    //Begin MapObj Files Output
    ------------------------------------------------------------------------------*/
    char opname[16];  //要输出的文件名
    CopyMemory(opname,MMBlist[j]+16,16);
    ChangeSpaceToNull(opname);
	lstrcat(opname,".MapObj");


    if (DoesFileExist(opname)) { logprintf("发现有文件重复将自动复盖,这些文件是%s",opname);}
    HANDLE hFile = CreateFile(opname,GENERIC_WRITE,FILE_SHARE_READ,NULL,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL );
    //ReadFile(hFile,pdat,dwSize,&dmy,NULL);	  

    if( hFile!=INVALID_HANDLE_VALUE && hFile!=NULL )
	{
    DWORD dmy;
    //SetFilePointer(hFile,0,NULL,FILE_END);

	LPSTR ReadLocate = MMBlist[j+1]-16;

	int size = (int)(((*(DWORD*)&ReadLocate[4])>>3)&0x007ffff0);

    WriteFile(hFile,&ReadLocate[0],size,&dmy,NULL);
    CloseHandle(hFile);
	}
   /*------------------------------------------------------------------------------
   //End MapObj Files Output
   ------------------------------------------------------------------------------*/

    DrawMMB(MMBlist[j]);

    //信息输出1
	{
    RECT rc={5,5,600,64};
    sprintf(buff,"正在绘制Index数=%d\nLookAt:X=%02.2f Y=%02.2f Z=%02.2f",pory,pos.x,pos.y,pos.z);
    pDxFont->DrawTextA(NULL,buff,lstrlen(buff),&rc, DT_LEFT,  D3DCOLOR_XRGB(196,196,0)); 
	}
    //信息输出2
	{
    RECT rc={5,48,600,96};
    sprintf(buff,"%sMZB=%d MMB=%d\n当前第%d个MMB",oj?"总共":"第",noj,NumMMB,j);
    pDxFont->DrawTextA(NULL,buff,lstrlen(buff),&rc, DT_LEFT,  D3DCOLOR_XRGB(196,196,0)); 
	}

	break;
	}//End For MumMMB

  break;
  }//End For Noj
    
  #ifdef _DEBUG
      if(0){
        char b[256];
        for( int i=0; i< noj; i++ ){
        if(i>=250) break;
        D3DCOLOR c = D3DCOLOR_XRGB(128,0,128);
        for( int j=0; j< NumMMB; j++ ){
          if( memcmp(MMBlist[j]+16,oj[i].id,16) ) continue;
          c = D3DCOLOR_XRGB(255,0,255);
          break;
        }
        RECT rc={(i/31)*130,(i%31)*14,640,480};
        CopyMemory(b,oj[i].id,16); b[16]='\0';
        pDxFont->DrawTextA(NULL,b,lstrlen(b),&rc, DT_LEFT, c ); 
      }
    }
  #endif

  //g_pD3DDevice->Present( NULL, NULL, NULL, NULL );//地图是在TheDesertWorld.cpp里画的
  wsprintf(buff,"map%d",ImgnoMap);
  WritePrivateProfileString("MAPERROR",buff,NULL,".\\TDWGame.ini");
  flgFirst=FALSE;
}