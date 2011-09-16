//------------------------------------------------------------------------------
//  File: TDWCharacter.h
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

static const D3DXMATRIX matrixMirrorX(-1.0f,0,0,0,  0, 1.0f,0,0,  0,0, 1.0f,0,  0,0,0,1.0f);
static const D3DXMATRIX matrixMirrorY( 1.0f,0,0,0,  0,-1.0f,0,0,  0,0, 1.0f,0,  0,0,0,1.0f);
static const D3DXMATRIX matrixMirrorZ( 1.0f,0,0,0,  0, 1.0f,0,0,  0,0,-1.0f,0,  0,0,0,1.0f);

static int const pcdat[8][7] = {
//Bone[8]   脸[32] 头[256] 体[1024] 武器[1280] Motion1:Basic Motion[384]  Motion2:Emotion Motion[192]
{ 7072,     7080,  7112,   7368,    8392,      9672,    10056}, //人类男
{ 10248,    10256, 10288,  10544,   11568,     12848,   13232}, //人类女
{ 13424,    13432, 13464,  13720,   14744,     16024,   16408}, //精灵男
{ 16600,    16608, 16640,  16896,   17920,     19200,   19584}, //精灵女
{ 19776,    19784, 19816,  20072,   21096,     22376,   22760}, //矮人男
{ 19776,    22952, 19816,  20072,   21096,     22376,   22984}, //矮人女
{ 23176,    23184, 23184,  23472,   24496,     25776,   26160}, //猫女
{ 26352,    26360, 26392,  26648,   27672,     28952,   29336}, //蜥蜴人
};

//换装实现
/*------------------------------------------------------------------------------
Begin Class FFXIParts
------------------------------------------------------------------------------*/
class FFXIParts
{
public:
  std::vector<TEXTEX> TexList;
  std::vector<DAT2A> dat2a;
  BOOL Draw2A(DAT2A*it);
  void GetVertex(DAT2A *d2a,int i, D3DTEXVERTEX *ppp,BOOL flip);

  BOOL AddVertex(char *p,int sz){
    DAT2A tmp; ZeroMemory(&tmp,sizeof(tmp));
    char *pp = new char [sz];
    CopyMemory(pp,p,sz);
    tmp.dat2A = pp;
    DAT2AHeader *pcp=(DAT2AHeader *)tmp.dat2A;
    tmp.dat2ahead = pcp;
    if((pcp->type&0x7f)==1){
      pcp->type=pcp->type;
    }
    tmp.weight1 =        ((short*)(tmp.dat2A+pcp->offsetWeight*2))[0];
    tmp.weight2 =        ((short*)(tmp.dat2A+pcp->offsetWeight*2))[1];
    tmp.pBone   =         (WORD*)(tmp.dat2A+pcp->offsetBone*2);
    tmp.pBoneTbl=         (WORD*)(tmp.dat2A+pcp->offsetBoneTbl*2);
    tmp.pVertex   = (MODELVERTEX1*)(tmp.dat2A+pcp->offsetVertex*2);
    tmp.pVertex2  = (MODELVERTEX2*)(((char*)tmp.pVertex)+ tmp.weight1*0x18    );
    tmp.pVertexC  = (CLOTHVERTEX1*)(tmp.dat2A+pcp->offsetVertex*2);
    tmp.pVertexC2 = (CLOTHVERTEX2*)(((char*)tmp.pVertex)+ tmp.weight1*0xC    );
    p += 2 * (*(short*)(p+0x6));
    tmp.pPoly   = (char*)(tmp.dat2A + pcp->offsetPoly*2);
    dat2a.push_back(tmp);
    return TRUE;
  }

  BOOL dat2aclear(void)
  {
    std::vector<DAT2A>::iterator it;
    for(it=dat2a.begin();it!=dat2a.end();it++){
      delete [](char*)(it->dat2A);
    }
    dat2a.clear();
    return TRUE;
  }
  BOOL texterurclear(void)
  {
    std::vector<TEXTEX>::iterator it;
    for(it=TexList.begin();it!=TexList.end();it++){
      if(it->pTex){
        it->pTex->Release();
        it->pTex = NULL;
      }
    }
    TexList.clear();
    return TRUE;
  }
  BOOL Clear(void){
    texterurclear();
    dat2aclear();
    return TRUE;
  }

  BOOL FFXIParts::AddList(char *p,int sz)
  {
  TEXTEX tmp;

  CopyMemory(tmp.ID,p+1,16); tmp.ID[16]=0;
  tmp.pTex = CreatTex(p+1+16);
  if( tmp.pTex ){
    TexList.push_back(tmp); 
    return TRUE;
  }
  return FALSE;
  }

};
/*------------------------------------------------------------------------------
Begin Class FFXIParts
------------------------------------------------------------------------------*/


#define PARTS 10     //角色与换装的结合点
/*------------------------------------------------------------------------------
Begin Class FFXICharacter
------------------------------------------------------------------------------*/
class FFXICharacter
{
public:
  FFXICharacter(){dat29=NULL;}
  BONE *dat29;
  FFXIParts parts[PARTS];
  //BONE2 dat29_2[128]; //偙傟偼128審攝楍偑偁傝傑偡
  //float *dat29_3;
  int  dat29Suu;
  std::vector<D3DXMATRIX> matBones;
  std::vector<D3DXMATRIX> mat;
  std::vector<DAT2BHeader*> dat2Bs;
  BOOL FFXICharacter::Draw2A(DAT2A*it,std::vector<TEXTEX> tex);
  void FFXICharacter::GetVertex(DAT2A *d2a,int i, D3DTEXVERTEX *ppp,BOOL flip);
  int  FFXICharacter::_GetBoneMatrix(DAT2BHeader *p2b, int frame);
  int  FFXICharacter::GetBoneMatrix(D3DXMATRIX *matrix, WORD bno);
  int  FFXICharacter::GetMotionMatrix(D3DXMATRIX *matrix, int no, DAT2BHeader *p2b,int frame );
  int  GetBoneNo1(DAT2A *d2a, WORD no, BOOL flgFlip, int &flg){ return GetBoneNo(d2a,no,flgFlip,flg,0);}
  int  GetBoneNo2(DAT2A *d2a, WORD no, BOOL flgFlip, int &flg){ return GetBoneNo(d2a,no,flgFlip,flg,1);}
  int  FFXICharacter::GetBoneNo(DAT2A *d2a, WORD no, BOOL flgFlip, int &flg, int c);
  BOOL SetBone(char *p,int sz){
      dat29Suu = (int)*(short*)(p+0x2);
      if( dat29 ) delete []dat29; dat29 = NULL;
      dat29 = new BONE[dat29Suu];
      CopyMemory(dat29,p+0x4,sizeof(BONE)*dat29Suu);

      //CopyMemory(&dat29_2,p+0x14+dat29Suu*sizeof(BONE)+4,sizeof(BONE2)*128);
      //dat29_3 = (float*)(&dat29_2[128]);
      for( int ii=0; ii<dat29Suu; ii++ ){
        D3DXMATRIX m1,m2;
        BONE &bn = dat29[ii];
        D3DXMatrixRotationQuaternion(&m1,(D3DXQUATERNION*)(&bn.i));
        D3DXMatrixTranslation(&m2,bn.x,bn.y,bn.z);
        D3DXMatrixMultiply(&m1,&m1,&m2);
        matBones[ii]=m1;
      }
    return TRUE;
  }
  BOOL AddVertex(int pn,char *p,int sz){
    parts[pn].AddVertex(p,sz);
    return TRUE;
  }

  BOOL AddAnimation(char *p,int sz)
  {
    char *pp = new char[sz];
    CopyMemory(pp,p,sz);
    dat2Bs.push_back((DAT2BHeader*)pp); 
    return TRUE;
  }
  BOOL partsclear(void)
  {
    for( int i=0;i<PARTS; i++ ){
      parts[i].Clear();
    }
    return TRUE;
  }
  BOOL dat2Bsclear(void)
  {
    std::vector<DAT2BHeader*>::iterator it;
    for(it=dat2Bs.begin();it!=dat2Bs.end();it++){
      delete [](char*)(*it);
    }
    dat2Bs.clear();
    return TRUE;
  }
  BOOL Clear(void){
    partsclear();
    dat2Bsclear();
    D3DXMATRIX m;
    D3DXMatrixIdentity(&m);
    matBones.assign(128,m);  mat.assign(128,m);
    if( dat29 ) delete []dat29; dat29 = NULL;
    dat29Suu = 0;
    return TRUE;
  }
  BOOL AddList(int pn,char *pp,int sz){
    return parts[pn].AddList(pp,sz);
  }
  BOOL IsEnable(){
    return (!parts[0].dat2a.empty())||(!parts[1].dat2a.empty());
  }
};
/*------------------------------------------------------------------------------
End Class FFXICharacter
------------------------------------------------------------------------------*/