//------------------------------------------------------------------------------
//  File: TDWCharacter.cpp
//  Desc: ffxi的角色单元     
//  Revision history:
//      * 2007/08/10 Created by Muzisoft05@163.com.
//
//  Todo:
//
//------------------------------------------------------------------------------

#include <windows.h>
#include <string.h>
#include <stdio.h>
#include <vector>
#include <string>

#include "TDWAnalysis.h"
#include "TDWGame.h"
#include "TDWCharacter.h"

PC pc={0,0,0,0,0,0,0,0};
PCFNO pcf;

int frame = 0;
int cngmode = 1;

/*------------------------------------------------------------------------------
Extern from The DersertWorld.cpp
------------------------------------------------------------------------------*/
extern HWND hwndMain;
extern LPD3DXFONT pDxFont;

extern int flgViewError;
extern BOOL flgViewError;
extern BOOL flgFirst;
extern BOOL isOK;

extern void __cdecl logprintf(LPCSTR lpszFormat, ...);
extern LPSTR sstr(LPSTR str,int n);

extern int imgnomdl;
extern int hyozino;

extern FFXIFile f;
extern FFXICharacter c;
/*------------------------------------------------------------------------------
end externing
------------------------------------------------------------------------------*/

//为模型设置view
void SetupViewMatrixMdl(void)
{
}

//确定avatar的各个部件
BOOL SetData(int pn,FFXIFile &f)
{
  int i;
  c.parts[pn].Clear();
  for( i=0; i< f.dwSize; ){
    int j=i;
    LPSTR iname = &f.pdat[i];
    int next = (int)(((*(DWORD*)&f.pdat[i+4])>>3)&0x007ffff0);
    if( next<16 ) break; //傑偀堘偆偩傠偆
    if( next+i>f.dwSize ) break;
    int type = (int)(((*(DWORD*)&f.pdat[i+4]))&0x7f);
    if( type==0x29 ){   //僐僺乕OK
      //儃乕儞忣曬捛壛
      //dat29.clear();
      c.SetBone(f.pdat+i+0x10,next-0x10);
    }
    if( type==0x2B ){
      //Animation捛壛
      c.AddAnimation(f.pdat+i+0x10,next-0x10);
    }
    if( type==0x2a ){
      //捀揰忣曬捛壛
      c.AddVertex(pn,f.pdat+i+0x10,next-0x10);
    }
    if( type==0x20 ){     //僐僺乕OK
      //僥僋僗僠儍捛壛
      if( IsImg(f.pdat+i+0x10) ){
        c.AddList(pn,f.pdat+i+0x10,next-0x10);
      }
    }
    i+=next;
    if( j>=i ) break; //柍尷儖乕僾杊巭
  }
  return TRUE;
}

//加载(不仅仅是把文件读入内存,更准确来说是分析读取,确定换装)
//用来加载角色的PC与NPC用
BOOL ImgLoad(int pn,int no, BOOL flgBase)
{
  char buff[256];

  FFXIFile f;
  
  wsprintf(buff,"The Desert World %s FileNo:%d",TDWVersion,no);
  SetWindowText(hwndMain,buff);
  if( f.Load(no) ){
    wsprintf(buff,"The Desert World %s FileNo:%d %s",TDWVersion,no,f.GetShortFilename());
    SetWindowText(hwndMain,buff);
  }

  if(flgBase){
    c.Clear();
  }

  SetData(pn,f);

  if(flgBase){
    wsprintf(buff,"%d",no);
    WritePrivateProfileString("GENERIC","LASTMODEL" ,buff,".\\TDWGame.ini");
  }
  return TRUE;
}

void GetLine(char *line, char**str)
{
  while(**str){
    if((**str)=='\r'||(**str)=='\n') break;
    *(line++) = *((*str)++);
  }
  while(**str){
    if((**str)!='\r' && (**str)!='\n') break;
    (*str)++;
  }
  *line = '\0';
}


BOOL GetName(LPSTR name,int ty, int no)
{
  int nt = -1;
  *name='\0';
  HANDLE hFile = CreateFile(".\\sobi.lst",GENERIC_READ,FILE_SHARE_WRITE|FILE_SHARE_READ,NULL,
                              OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL );
  if( hFile==INVALID_HANDLE_VALUE ){
    return FALSE;
  }
  DWORD  sz = GetFileSize(hFile,NULL);
  DWORD dmy;
  char *p = new char[sz];
  ReadFile(hFile,p,sz,&dmy,NULL);
  CloseHandle(hFile);
  char *str = p;
  while(*str){
    char buff[256];
    GetLine(buff,&str);
    if(buff[0]=='*'){ nt = atoi(buff+1); continue; }
    if(nt!=ty) continue;
    if( no == atoi(buff) ){
      lstrcpy(name,buff+5);
      break;
    }
  }
  delete []p;
  return TRUE;
}

BOOL ImgLoadNPC(int no)
{
  ImgLoad(0,no,TRUE);
  return TRUE;
}

BOOL ImgLoadPC(PC *pc,int pt)
{
  int fno; char fname[512];
  if(pt==0||pt==-1){
    fno = pcdat[pc->syuzoku][0];              ImgLoad(0,fno,TRUE);
    GetFileNameFromFileID(fname,fno); pcf.syuzoku =&fname[lstrlen(ffxidir)];
    fno = pcdat[pc->syuzoku][0]+0;              ImgLoad(0,fno,FALSE);
    fno = pcdat[pc->syuzoku][0]+1;              ImgLoad(0,fno,FALSE);
    fno = pcdat[pc->syuzoku][0]+2;              ImgLoad(0,fno,FALSE);
    fno = pcdat[pc->syuzoku][0]+3;              ImgLoad(0,fno,FALSE);
    fno = pcdat[pc->syuzoku][0]+4;              ImgLoad(0,fno,FALSE);
    fno = pcdat[pc->syuzoku][0]+5;              ImgLoad(0,fno,FALSE);
    fno = pcdat[pc->syuzoku][0]+6;              ImgLoad(0,fno,FALSE);
    fno = pcdat[pc->syuzoku][0]+7;              ImgLoad(0,fno,FALSE);
  }

  if(pt==1||pt==-1){
  fno = pcdat[pc->syuzoku][1]+pc->facetype; ImgLoad(1,fno,FALSE);
  GetFileNameFromFileID(fname,fno); pcf.facetype = &fname[lstrlen(ffxidir)];
  }

  if(pt==2||pt==-1){
  fno = pcdat[pc->syuzoku][2]+pc->head;     ImgLoad(2,fno,FALSE);
  GetFileNameFromFileID(fname,fno); pcf.head = &fname[lstrlen(ffxidir)];
  }

  if(pt==3||pt==-1){
  fno = pcdat[pc->syuzoku][3]+pc->body;     ImgLoad(3,fno,FALSE);
  GetFileNameFromFileID(fname,fno); pcf.body = &fname[lstrlen(ffxidir)];
  }

  if(pt==4||pt==-1){
  fno = pcdat[pc->syuzoku][3]+256+pc->hands;ImgLoad(4,fno,FALSE);
  GetFileNameFromFileID(fname,fno); pcf.hands = &fname[lstrlen(ffxidir)];
  }

  if(pt==5||pt==-1){
  fno = pcdat[pc->syuzoku][3]+512+pc->waist;ImgLoad(5,fno,FALSE);
  GetFileNameFromFileID(fname,fno); pcf.waist = &fname[lstrlen(ffxidir)];
  }


  if(pt==6||pt==-1){
  fno = pcdat[pc->syuzoku][3]+768+pc->legs; ImgLoad(6,fno,FALSE);
  GetFileNameFromFileID(fname,fno); pcf.legs = &fname[lstrlen(ffxidir)];
  }

  if(pt==7||pt==-1){
  fno = pcdat[pc->syuzoku][4]+pc->buki;     ImgLoad(7,fno,FALSE);
  GetFileNameFromFileID(fname,fno); pcf.buki = &fname[lstrlen(ffxidir)];
  }

  /*
  if(pt==8||pt==-1){
   fno = pcdat[pc->syuzoku][5]+0;     ImgLoad(8,fno,FALSE);
  }
  if(pt==9||pt==-1){
   fno = pcdat[pc->syuzoku][6]+0;     ImgLoad(9,fno,FALSE);
  }
  */
  return TRUE;
}

//从dat2a中得到第no个骨骼(Memo中指出bone混合在dat2a中)
int FFXICharacter::GetBoneNo(DAT2A *d2a, WORD no, BOOL flgFlip, int &flg, int c)
{
  int ret;
  int tblidx;                        
  WORD bone;                        

  if( c==0 ) bone = d2a->pBone[no*2  ];
  else       bone = d2a->pBone[no*2+1];

  tblidx=(bone)&0x7f;
  flg = (bone>>14)&0x3;
  if(flgFlip) bone>>=7;
  tblidx = bone&0x7f;

  if( flg==0 ){
    flg=0;
  }

  if(d2a->dat2ahead->type&0x80) ret = d2a->pBoneTbl[tblidx];
  else                          ret = tblidx;

  if(dat29Suu && ret>=dat29Suu){
    //ret%=dat29Suu;
  }
  return ret;
}

//求得Frame间的Matrixs
int FFXICharacter::GetMotionMatrix(D3DXMATRIX *matrix, int no, DAT2BHeader *p2b,int frame )
{
  if(p2b && p2b->element>no ){
    float n = ((float)(frame % 1000))/1000.0f;
    //float n = ((float)(frame % 1000))/1000.0f/p2b->speed;
    frame /= 1000;
    if(p2b->frame<=1) frame = 0;
    else              frame %= (p2b->frame-1);
    DAT2B &dat = p2b->dat[no];
    float *f = p2b->f;
    //D3DXMATRIX m1,m2,m3;
    D3DXQUATERNION qt,qt2;
    D3DXVECTOR3 tr,tr2;
    D3DXVECTOR3 sc,sc2;
    D3DXVECTOR3 cent(0.f,0.f,0.f);
    if((dat.idx_qtx|dat.idx_qty|dat.idx_qtz|dat.idx_qtw)&0x80000000){
      //idx抣偑0x80000000偵側傕偺偑偁傞丅
      D3DXMatrixIdentity(matrix);
      return dat.no;
      dat.idx_qtx=dat.idx_qtx;
    }
    //夞揮
    if(dat.idx_qtx){ qt.x = f[dat.idx_qtx+frame];  qt2.x = f[dat.idx_qtx+frame+1]; } else{ qt.x = dat.qtx; qt2.x = dat.qtx; }
    if(dat.idx_qty){ qt.y = f[dat.idx_qty+frame];  qt2.y = f[dat.idx_qty+frame+1]; } else{ qt.y = dat.qty; qt2.y = dat.qty; }
    if(dat.idx_qtz){ qt.z = f[dat.idx_qtz+frame];  qt2.z = f[dat.idx_qtz+frame+1]; } else{ qt.z = dat.qtz; qt2.z = dat.qtz; }
    if(dat.idx_qtw){ qt.w = f[dat.idx_qtw+frame];  qt2.w = f[dat.idx_qtw+frame+1]; } else{ qt.w = dat.qtw; qt2.w = dat.qtw; }
    D3DXQuaternionSlerp( &qt,&qt,&qt2,n);
    //D3DXMatrixRotationQuaternion(&m1,&qt);
    //堏摦
    if(!dat.idx_tx) tr.x = dat.tx; else tr.x = f[dat.idx_tx+frame]*(1.0f-n) + f[dat.idx_tx+frame+1]*n;
    if(!dat.idx_ty) tr.y = dat.ty; else tr.y = f[dat.idx_ty+frame]*(1.0f-n) + f[dat.idx_ty+frame+1]*n;
    if(!dat.idx_tz) tr.z = dat.tz; else tr.z = f[dat.idx_tz+frame]*(1.0f-n) + f[dat.idx_tz+frame+1]*n;
    //D3DXMatrixTranslation(&m2,tr.x,tr.y,tr.z);
    //僗働乕儖
    if(!dat.idx_sx) sc.x = dat.sx; else sc.x = f[dat.idx_sx+frame]*(1.0f-n) + f[dat.idx_sx+frame+1]*n;
    if(!dat.idx_sy) sc.y = dat.sy; else sc.y = f[dat.idx_sy+frame]*(1.0f-n) + f[dat.idx_sy+frame+1]*n;
    if(!dat.idx_sz) sc.z = dat.sz; else sc.z = f[dat.idx_sz+frame]*(1.0f-n) + f[dat.idx_sz+frame+1]*n;
    //D3DXMatrixScaling(&m3,sc.x,sc.y,sc.z);
    D3DXVec3TransformCoord(&cent,&cent,&mat[dat.no]);
    D3DXMatrixTransformation(matrix,&cent,&qt,&sc,&cent,&qt,&tr);

    //*matrix = m2* m1 * m3;
    //D3DXMatrixTransformation
    //*matrix = m3* m2 * m1;
    return dat.no;
  }
  D3DXMatrixIdentity(matrix);
  return -1;
}

//根据Frame Matrixs求得Bone Matrixs
int FFXICharacter::_GetBoneMatrix(DAT2BHeader *p2b, int frame)
{
  int i;
  int fr=0;
  D3DXMATRIX m1;
  //mat = matBones;
  for(i=0;i<128;i++) mat[i] = matBones[i];
  //傾僯儊乕僔儑儞偺揔梡
  if(p2b){
    for(i=0;i<p2b->element;i++){
      int bno = GetMotionMatrix(&m1,i,p2b,frame);
      if(bno>=0) mat[bno]*=m1;
    }
    fr = int(p2b->speed*1000);
  }
  for( i=0; i<dat29Suu; i++ ){
    BONE &bn = dat29[i];
    if( bn.parent ) D3DXMatrixMultiply(&mat[i],&mat[i],&mat[bn.parent]);
  }
  return fr;
}

//求得Bone间的Matrixs
int FFXICharacter::GetBoneMatrix(D3DXMATRIX *matrix, WORD bno)
{
  *matrix = mat[bno];
  return  0;
}

//求得最终各顶点坐标
void FFXICharacter::GetVertex(DAT2A *d2a,int i, D3DTEXVERTEX *ppp,BOOL flip)
{
  int bno1,bno2;
  int flg;
  D3DXVECTOR4 p1,h1,p2,h2;
  D3DXMATRIX m1,m2;
  D3DXMATRIX mp1,mp2;
  D3DXMATRIX ms1,ms2;
  ppp->color = 0xffffffff;
  if(i<d2a->weight1){
    bno1 = GetBoneNo1(d2a,i,flip,flg);
    GetBoneMatrix(&m1,bno1);
    if(flip){ 
      if(flg==3)  m1 = matrixMirrorZ * m1;
      if(flg==2)  m1 = matrixMirrorY * m1;
      if(flg==1)  m1 = matrixMirrorX * m1;
    }
    if((d2a->dat2ahead->type&0x7f)==0){
      p1.x = d2a->pVertex[i].x;
      p1.y = d2a->pVertex[i].y;
      p1.z = d2a->pVertex[i].z;
      p1.w = 1.0f;
      h1.x = d2a->pVertex[i].hx;
      h1.y = d2a->pVertex[i].hy;
      h1.z = d2a->pVertex[i].hz;
      h1.w = 0.0f;
    }else{
      p1.x = d2a->pVertexC[i].x;
      p1.y = d2a->pVertexC[i].y;
      p1.z = d2a->pVertexC[i].z;
      p1.w = 1.0f;
      //朄慄偼偳偙偐傜堷偭挘偭偰偔傟偽傛偄丠
    }
    D3DXVec4Transform(&p1,&p1,&m1);  D3DXVec4Transform(&h1,&h1,&m1);
    ppp->x= p1.x; ppp->y= p1.y; ppp->z =p1.z;
    ppp->hx=h1.x; ppp->hy=h1.y; ppp->hz=h1.z;
  }else{
    bno1 = GetBoneNo1(d2a,i,flip,flg);
    GetBoneMatrix(&m1,bno1);
    if(flip){ 
      if(flg==3) m1 = matrixMirrorZ * m1;
      if(flg==2) m1 = matrixMirrorY * m1;
      if(flg==1) m1 = matrixMirrorX * m1;
    }
    bno2 = GetBoneNo2(d2a,i,flip,flg);
    GetBoneMatrix(&m2,bno2);
    if(flip){ 
      if(flg==3) m2 = matrixMirrorZ * m2;
      if(flg==2) m2 = matrixMirrorY * m2;
      if(flg==1) m2 = matrixMirrorX * m2;
    }

    i -= d2a->weight1;
    if((d2a->dat2ahead->type&0x7f)==0){
      p1.x = d2a->pVertex2[i].x1;    p2.x = d2a->pVertex2[i].x2;  
      p1.y = d2a->pVertex2[i].y1;    p2.y = d2a->pVertex2[i].y2;  
      p1.z = d2a->pVertex2[i].z1;    p2.z = d2a->pVertex2[i].z2;  
      p1.w = d2a->pVertex2[i].w1;    p2.w = d2a->pVertex2[i].w2;  
      h1.x = d2a->pVertex2[i].hx1;   h2.x = d2a->pVertex2[i].hx2; 
      h1.y = d2a->pVertex2[i].hy1;   h2.y = d2a->pVertex2[i].hy2; 
      h1.z = d2a->pVertex2[i].hz1;   h2.z = d2a->pVertex2[i].hz2; 
      h1.w = 0.0f;                   h2.w = 0.0f;  
    }else{
      p1.x = d2a->pVertexC2[i].x1;    p2.x = d2a->pVertexC2[i].x2;  
      p1.y = d2a->pVertexC2[i].y1;    p2.y = d2a->pVertexC2[i].y2;  
      p1.z = d2a->pVertexC2[i].z1;    p2.z = d2a->pVertexC2[i].z2;  
      p1.w = d2a->pVertexC2[i].w1;    p2.w = d2a->pVertexC2[i].w2;  
      //朄慄偼偳偙偐傜堷偭挘偭偰偔傟偽傛偄丠
    }
    //D3DXVec3TransformCoord(&p1,&p1,&m1);  D3DXVec3TransformCoord(&p2,&p2,&m2); 
    D3DXVec4Transform(&p1,&p1,&m1); D3DXVec4Transform(&p2,&p2,&m2);
    D3DXVec4Transform(&h1,&h1,&m1); D3DXVec4Transform(&h2,&h2,&m2); 
    //D3DXVec3TransformNormal(&h1,&h1,&m1); D3DXVec3TransformNormal(&h2,&h2,&m2); 
    //p1=p1*d2a->pVertex2[i].w1;  p2=p2*d2a->pVertex2[i].w2; 
    h1=h1*d2a->pVertex2[i].w1;  h2=h2*d2a->pVertex2[i].w2; 
    ppp->x  = p1.x+p2.x; ppp->y =p1.y+p2.y; ppp->z =p1.z+p2.z;
    ppp->hx = h1.x+h2.x; ppp->hy=h1.y+h2.y; ppp->hz=h1.z+h2.z;
  }
}


BOOL FFXICharacter::Draw2A(DAT2A*it,std::vector<TEXTEX> tex){
      //if(num!=1) continue;
      int flip =0;
      if( !it->dat2ahead->flip && flip ) return FALSE;
      int num8010=0,num8000=0,num5453=0,num4345=0,num0054=0,num0043=0;
      g_pD3DDevice->SetRenderState( D3DRS_ALPHATESTENABLE , TRUE );
      do{
        if(flip)g_pD3DDevice->SetRenderState( D3DRS_CULLMODE,     D3DCULL_CCW );
        else g_pD3DDevice->SetRenderState( D3DRS_CULLMODE,     D3DCULL_CW  );

        int uuuu=0;
        num8010=0,num8000=0,num5453=0,num4345=0,num0054=0,num0043=0;
        char *p = it->pPoly;
        while(1){
          int wf = (int)*(WORD*)(p  );
          int ws = (int)*(WORD*)(p+2);
          if( 0x8010 == (wf&0x80F0) ){ 
            dat8000 *dat = (dat8000*)(p+2);
            p+=0x2e; num8010++;
            continue;  //晄柧
          } else
          if( 0x8000 == (wf&0x80F0) ){ //僥僋僗僠儍偺曄峏
            num8000++;
            g_pD3DDevice->SetTexture(0,NULL); 
            std::vector<TEXTEX>::iterator it;
            for(it=tex.begin();it!=tex.end();it++){
              if( !memcmp(p+2,it->ID,16) ){
                g_pD3DDevice->SetTexture(0, it->pTex); 
                g_pD3DDevice->SetTextureStageState(0, D3DTSS_COLOROP, D3DTOP_MODULATE2X);
                g_pD3DDevice->SetTextureStageState(0, D3DTSS_COLORARG1, D3DTA_TEXTURE);
                g_pD3DDevice->SetTextureStageState(0, D3DTSS_COLORARG2, D3DTA_DIFFUSE);

                g_pD3DDevice->SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_MODULATE4X);
                g_pD3DDevice->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
                g_pD3DDevice->SetTextureStageState(0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE);

                //g_pD3DDevice->SetTextureStageState(0, D3DTSS_MAGFILTER, D3DTEXF_LINEAR );
                //g_pD3DDevice->SetTextureStageState(0, D3DTSS_MINFILTER, D3DTEXF_LINEAR);
                break;
              }
            }
            p+=0x12;
          } else
          if( 0x5453 == wf ){/*ST*/  //StripTriangle
            num5453++;
            D3DTEXVERTEX *ppp = new D3DTEXVERTEX[ws+2];
            TEXLIST *tl = (TEXLIST *)(p+4);
            int k=0;
            ppp[k*3+0].tu = tl[k].u1; ppp[k*3+0].tv = tl[k].v1;
            GetVertex(it,tl[k].i1,&ppp[k*3+0],flip);           //VC.NET2002偱僄儔乕偑弌傞偦偆側丅扤偐夞旔曽朄嫵偊偰偔偩偝偄丅
            ppp[k*3+1].tu = tl[k].u2; ppp[k*3+1].tv = tl[k].v2;
            GetVertex(it,tl[k].i2,&ppp[k*3+1],flip);           //VC.NET2002偱僄儔乕偑弌傞偦偆側丅扤偐夞旔曽朄嫵偊偰偔偩偝偄丅
            ppp[k*3+2].tu = tl[k].u3; ppp[k*3+2].tv = tl[k].v3;
            GetVertex(it,tl[k].i3,&ppp[k*3+2],flip);           //VC.NET2002偱僄儔乕偑弌傞偦偆側丅扤偐夞旔曽朄嫵偊偰偔偩偝偄丅

            TEXLIST2 *tl2 = (TEXLIST2 *)(p+4+0x1e);
            for( k=0; k<ws-1; k++ ){
              ppp[k+3].tu = tl2[k].u;
              ppp[k+3].tv = tl2[k].v;
              GetVertex(it,tl2[k].i,&ppp[k+3],flip);           //VC.NET2002偱僄儔乕偑弌傞偦偆側丅扤偐夞旔曽朄嫵偊偰偔偩偝偄丅
            }
            g_pD3DDevice->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP,ws,ppp,36 );
            delete []ppp;
            p+=ws*10  + 0x18;
            continue;
          } else
          if( 0x4353 == wf ){ /*SC*/p+=ws*20  + 0x0C; num4345++; continue; } else //晄柧
          if( 0x0043 == wf ){ /*C*/p+=ws*10  + 0x4;  num0043++; continue; } else //晄柧
          if( 0x0054 == wf ){  /*T*/ //TriangleList
            num0054++;
            D3DTEXVERTEX *ppp = new D3DTEXVERTEX[ws*3];
            TEXLIST *tl = (TEXLIST *)(p+4);
            for( int k=0; k<ws; k++ ){
              ppp[k*3+0].tu = tl[k].u1;
              ppp[k*3+0].tv = tl[k].v1;
              GetVertex(it,tl[k].i1,&ppp[k*3+0],flip);         //VC.NET2002偱僄儔乕偑弌傞偦偆側丅扤偐夞旔曽朄嫵偊偰偔偩偝偄丅
              ppp[k*3+1].tu = tl[k].u2;
              ppp[k*3+1].tv = tl[k].v2;
              GetVertex(it,tl[k].i2,&ppp[k*3+1],flip);         //VC.NET2002偱僄儔乕偑弌傞偦偆側丅扤偐夞旔曽朄嫵偊偰偔偩偝偄丅
              ppp[k*3+2].tu = tl[k].u3;
              ppp[k*3+2].tv = tl[k].v3;
              GetVertex(it,tl[k].i3,&ppp[k*3+2],flip);         //VC.NET2002偱僄儔乕偑弌傞偦偆側丅扤偐夞旔曽朄嫵偊偰偔偩偝偄丅
            }
            g_pD3DDevice->DrawPrimitiveUP(D3DPT_TRIANGLELIST,ws,ppp,36 );
            delete []ppp;
            p+=ws*30  + 0x4;
            continue;
          } else break;
        }
        flip++;
      }while(flip==1&&it->dat2ahead->flip);
#ifdef _DEBUG
#if 0
      char buff[512];
      g_pD3DDevice->SetRenderState( D3DRS_ALPHATESTENABLE , FALSE );
      RECT rc;
      GetClientRect(hwndMain,&rc); rc.top=num*40;
      pDxFontS->DrawTextA(it->dat2A-16,4,&rc, DT_LEFT, D3DCOLOR_XRGB(64,64,64)); 
      DAT2AHeader *pcp=it->dat2ahead;
      wsprintf(buff,"       Version%d type:%s Pory:%d BoneTbl:%d Weight:%d Bone:%d Vertex:%d\nPolyLoad:%d PolyLodVtx0:%d PolyLodVtx1:%d PolyLod2:%d \n"
                    "weight1:%d weight2:%d 8010:%d 8000:%d 5453:%d 4345:%d 0054:%d 0043:%d FLIP:%s"
              ,(int)pcp->ver, (pcp->type&0x7f)==0?"Model":"Cloth",pcp->PolySuu,pcp->BoneTblSuu,pcp->WeightSuu,pcp->BoneSuu,pcp->VertexSuu,pcp->PolyLoadSuu,pcp->PolyLodVtx0Suu,pcp->PolyLodVtx1Suu,pcp->PolyLoadSuu
              ,it->weight1,it->weight2
              ,num8010,num8000,num5453,num4345,num0054,num0043
              ,it->dat2ahead->flip?"ON":"OFF"
              );
      pDxFontS->DrawTextA(buff,lstrlen(buff),&rc, DT_LEFT, flgSkip?D3DCOLOR_ARGB(64,255,64,64):D3DCOLOR_ARGB(128,64,64,255) ); 
#endif
#endif
      return FALSE;
}


void DrawCharacter(void)
{
  char buff[512];
  if( flgFirst ) logprintf("-------------------------------------------------------------------MapNo:%d偺昤夋傪奐巒偟傑偡丅",imgnomdl);


    
  // wsprintf(buff,"model%d",imgnomdl);
 // WritePrivateProfileString("MODELERROR",buff,"1",".\\ffxitool.ini");


  //SetupViewMatrixMdl
  D3DXMATRIX matView; D3DXMatrixRotationX(&matView,0.0);
  D3DXMATRIX matProj;
  static D3DXMATRIX matWorld=matView;
  static float viewYPos=-1;
  D3DXMATRIX mat;

//控制input

  DAT2BHeader *p2b=NULL;

  static int ano=0;

//  if( GetAsyncKeyState(VK_RETURN)  & 0x1 ){ ano++; frame=0;}
  if(!c.dat2Bs.empty()){
    ano%=c.dat2Bs.size();
    p2b = c.dat2Bs.at(ano);
  }else p2b = NULL;

  

  static float mawari = 4.00f;
  float delta;
  delta = 0.05f;
  if( GetKeyState(VK_CONTROL)&0x8000 ){ delta = 0.5f; };
  if( GetKeyState(VK_INSERT)& 0x8000 ){ mawari-=delta; }
  if( GetKeyState(VK_DELETE)& 0x8000 ){ mawari+=delta; }
  if( GetKeyState(VK_PRIOR) & 0x8000 ){ viewYPos+=delta;  }
  if( GetKeyState(VK_NEXT)  & 0x8000 ){ viewYPos-=delta;  }
  if( mawari< 0.05f ) mawari= 0.05f;
  delta = 3.1415926f/180.0f;
  if( GetKeyState(VK_CONTROL)&0x8000 ){ delta = 3.1415926f/30.0f; };
  if( GetKeyState(VK_UP)    & 0x8000 ){ D3DXMatrixRotationX(&mat,delta); matWorld*=mat;  }
  if( GetKeyState(VK_DOWN)  & 0x8000 ){ D3DXMatrixRotationX(&mat,-delta); matWorld*=mat; }
  if( GetKeyState(VK_RIGHT) & 0x8000 ){ D3DXMatrixRotationY(&mat,delta); matWorld*=mat;  }
  if( GetKeyState(VK_LEFT)  & 0x8000 ){ D3DXMatrixRotationY(&mat,-delta); matWorld*=mat;  }
  //if( GetKeyState(VK_PRIOR) & 0x8000 ){ D3DXMatrixRotationZ(&mat,delta); matWorld*=mat;  }
  //if( GetKeyState(VK_NEXT)  & 0x8000 ){ D3DXMatrixRotationZ(&mat,-delta); matWorld*=mat;  }
  if( GetKeyState(VK_HOME)  & 0x8000 ){ viewYPos=-1; mawari=4.00f; D3DXMatrixRotationX(&matWorld,0.0); }

  ///////////end input


  D3DXVECTOR3 pnt(0.0f,viewYPos,0.0f);
  D3DXVECTOR3 up(0.0f, 1.0f, 0.0f);
  D3DXVECTOR3 ps(0.0f,viewYPos,-mawari);
  D3DXMatrixLookAtLH(&matView, &ps, &pnt, &up);
  g_pD3DDevice->SetTransform(D3DTS_VIEW, &matView); 

  D3DXMatrixPerspectiveFovLH(&matProj, DEGtoRAD(45.0f), 4.0f / 3.0f, 0.01f, 10.0f);
  g_pD3DDevice->SetTransform(D3DTS_PROJECTION, &matProj);

  //D3DXMatrixRotationYawPitchRoll(&matWorld,pos.x,pos.y,pos.z);
  g_pD3DDevice->SetTransform(D3DTS_WORLD, &matWorld); 
  //eend setupview






////bgein renderstate
  g_pD3DDevice->SetRenderState( D3DRS_CULLMODE,     D3DCULL_CW/*/D3DCULL_NONE*/  );
  //g_pD3DDevice->SetRenderState( D3DRS_FOGTABLEMODE,     D3DFOG_NONE );

  g_pD3DDevice->SetRenderState( D3DRS_ZENABLE, D3DZB_TRUE );
  //g_pD3DDevice->SetRenderState( D3DRS_ZWRITEENABLE, TRUE );
  //g_pD3DDevice->SetRenderState( D3DRS_ZVISIBLE, TRUE );

  g_pD3DDevice->SetRenderState( D3DRS_STENCILENABLE, TRUE );
  g_pD3DDevice->SetRenderState( D3DRS_ALPHATESTENABLE , TRUE );
  g_pD3DDevice->SetRenderState( D3DRS_ALPHAREF , 0x80 );
  g_pD3DDevice->SetRenderState( D3DRS_ALPHAFUNC  , D3DCMP_GREATER );
  //g_pD3DDevice->SetLight(0,&light);
  //g_pD3DDevice->LightEnable(0,FALSE);
  g_pD3DDevice->SetRenderState(D3DRS_LIGHTING,FALSE);
  g_pD3DDevice->SetRenderState(D3DRS_NORMALIZENORMALS,TRUE);
  //g_pD3DDevice->SetRenderState(D3DRS_COLORVERTEX,FALSE);
 
  g_pD3DDevice->SetRenderState(D3DRS_AMBIENT, 0xFFFFFF);
  g_pD3DDevice->SetRenderState(D3DRS_SHADEMODE, D3DSHADE_GOURAUD );

  g_pD3DDevice->SetRenderState(D3DRS_ALPHABLENDENABLE, TRUE);
  //g_pD3DDevice->SetRenderState(D3DRS_EDGEANTIALIAS,FALSE);
  g_pD3DDevice->SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
  g_pD3DDevice->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA); 

////bgein renderstate



  g_pD3DDevice->BeginScene();
  if( c.IsEnable() ){
    //////////////////////////////////////////////////////////////////////////////////////////
    //夋柺弶婜壔
  //  g_pD3DDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(192,192,255), 1.0f, 1L );
                                 
    //////////////////////////////////////////////////////////////////////////////////////////
    //拞怱偺廫帤
    {
       float pp[]={-1,0,0,1,0,0, 0,-1,0,0,1,0, 0,0,-1,0,0,1};
      g_pD3DDevice->SetFVF(D3DFVF_XYZ);
      g_pD3DDevice->DrawPrimitiveUP(D3DPT_LINELIST,3,pp,12);
    }

    //////////////////////////////////////////////////////////////////////////////////////////
    //抧柺丒丒偺偮傕傝
    {
      D3DTEXVERTEX pp[]={{-10,0,-10,0,1,0,0xFF00ff00,0,0},{-10,0,10,0,1,0,0xFF00ff00,0,0},{10,0,-10,0,1,0,0xFFff0000,0,0},{10,0,10,0,1,0,0xFF000000,0,0}};
      g_pD3DDevice->SetRenderState( D3DRS_CULLMODE,     D3DCULL_CW  );
      g_pD3DDevice->SetFVF(D3DFVF_TEXVERTEX);
      g_pD3DDevice->SetTexture(0,NULL); 
      g_pD3DDevice->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP,2,pp,36);
    }

    //////////////////////////////////////////////////////////////////////////////////////////
    //儌僨儖昤夋
    std::vector<DAT2A>::iterator it;
    g_pD3DDevice->SetFVF(D3DFVF_TEXVERTEX);
    int num=0;
    for(int i=0;i<PARTS;i++){
      FFXIParts &part = c.parts[i];
      for(it=part.dat2a.begin();it!=part.dat2a.end();it++,num++){
        BOOL flgSkip = (hyozino>=0 && num!=hyozino);
        int flip =0;
        if( !it->dat2ahead->flip && flip ) continue;
        c.Draw2A(&*it,part.TexList);
      }
    }

    //////////////////////////////////////////////////////////////////////////////////////////
    //忣曬昞帵
    g_pD3DDevice->SetRenderState( D3DRS_ALPHATESTENABLE , FALSE );
    RECT rc;
    GetClientRect(hwndMain,&rc);
    if(p2b){
      pDxFont->DrawTextA(NULL, ((char*)p2b)-16,4,&rc, DT_RIGHT|DT_TOP, D3DCOLOR_ARGB(192,255,0,0) ); 
      if(p2b->frame>1) wsprintf(buff,"\nEnterKey切换Motion %d/%d\nFrame  %d.%03d/%d.000\nSpeed:%d",ano+1,c.dat2Bs.size(),((frame/1000)%(p2b->frame-1)),frame%1000,(p2b->frame-1),(long)(p2b->speed*1000));
      else             wsprintf(buff,"\nEnterKey切换Motion %d/%d\nFrame  0.%03d/%d.000\nSpeed:%d",ano+1,c.dat2Bs.size(),frame%1000,(p2b->frame-1),(long)(p2b->speed*1000));
      pDxFont->DrawTextA(NULL, buff,lstrlen(buff),&rc, DT_RIGHT|DT_TOP, D3DCOLOR_ARGB(192,255,0,0) ); 
    }
    //PC愱梡
    if(cngmode>0&&pc.syuzoku>=0){
      char name[512];
      GetName(name,2,pc.buki);
      static const char *n[]={"---","脸型","头饰","服装","护腕","护腰","护腿","武器"};
      static const char *s[]={"人类男","人类女","精灵男","精灵女","矮人男","矮人女","猫人","巨人"};
      wsprintf(buff,"当前选择(按F1-F7)了部位:%s,按 +- 换装\n当前选择(按1-9)了种族:%-12s %s\n  Face:%-12d %s\n  Head:%-12d %s\n  Body:%-12d %s\n Waist:%-12d %s\n  Legs:%-12d %s\nWeapon:%-12d %s %s"
                     ,n[cngmode],s[pc.syuzoku],pcf.syuzoku.c_str()
                     ,pc.facetype,pcf.facetype.c_str()
                     ,pc.head,pcf.head.c_str()
                     ,pc.body,pcf.body.c_str()
                     ,pc.waist,pcf.waist.c_str()
                     ,pc.legs,pcf.legs.c_str()
                     ,pc.buki,pcf.buki.c_str(),name);
      pDxFont->DrawTextA(NULL,buff,lstrlen(buff),&rc, DT_LEFT|DT_TOP, D3DCOLOR_ARGB(192,0,0,255) ); 
    }
    g_pD3DDevice->EndScene();
  }else{
    g_pD3DDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(255,255,192), 1.0f, 0L );
  }

  g_pD3DDevice->Present( NULL, NULL, NULL, NULL );  //人物是在这里画的,而地图是在主程序里画的
  wsprintf(buff,"model%d",imgnomdl);
  WritePrivateProfileString("MODELERROR",buff,NULL,".\\TDWGame.ini");
  flgFirst=FALSE;
}


