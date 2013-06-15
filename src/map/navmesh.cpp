/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#include "navmesh.h"
#include "../common/detour/DetourNavMeshQuery.h"
#include <string.h>
#include "../common/utils.h"

CNavMesh::CNavMesh()
{
  m_navMesh = NULL;
}

CNavMesh::~CNavMesh()
{
  delete m_navMesh;
}

bool CNavMesh::load(char* path)
{
  this->path = path;
  this->unload();

  m_navMesh = new dtNavMesh();

  FILE* fp = fopen(path, "rb");

  if (!fp)
  {
    ShowError("CNavMesh::load Error loading navmesh (%s)\n", path);
    return false;
  }

  // Read header.
  NavMeshSetHeader header;
  fread(&header, sizeof(NavMeshSetHeader), 1, fp);
  if (header.magic != NAVMESHSET_MAGIC)
  {
    fclose(fp);
    return 0;
  }
  if (header.version != NAVMESHSET_VERSION)
  {
    fclose(fp);
    return 0;
  }

  m_navMesh = dtAllocNavMesh();
  if (!m_navMesh)
  {
    fclose(fp);
    return 0;
  }

  dtStatus status = m_navMesh->init(&header.params);
  if (dtStatusFailed(status))
  {
    ShowError("CNavMesh::load Could not initialize detour for (%s)", path);
    outputError(status);
    return 0;
  }

  // Read tiles.
  for (int i = 0; i < header.numTiles; ++i)
  {
    NavMeshTileHeader tileHeader;
    fread(&tileHeader, sizeof(tileHeader), 1, fp);
    if (!tileHeader.tileRef || !tileHeader.dataSize)
            break;

    unsigned char* data = (unsigned char*)dtAlloc(tileHeader.dataSize, DT_ALLOC_PERM);
    if (!data) break;
    memset(data, 0, tileHeader.dataSize);
    fread(data, tileHeader.dataSize, 1, fp);

    m_navMesh->addTile(data, tileHeader.dataSize, DT_TILE_FREE_DATA, tileHeader.tileRef, 0);

  }

  fclose(fp);

  m_navMeshQuery = new dtNavMeshQuery();

  // init detour nav mesh path finder
  status = m_navMeshQuery->init(m_navMesh, MAX_NAV_POLYS);

  if(dtStatusFailed(status))
  {
    ShowError("CNavMesh::load Error loading navmeshquery (%s)\n", path);
    outputError(status);
    return false;
  }

  return true;
}

void CNavMesh::outputError(uint32 status)
{

  if(status & DT_WRONG_MAGIC)
  {
    ShowError("Detour wrong magic\n");
  }
  else if(status & DT_WRONG_VERSION)
  {
    ShowError("Detour wrong version\n");
  }
  else if(status & DT_OUT_OF_MEMORY)
  {
    ShowError("Detour out of memory\n");
  }
  else if(status & DT_INVALID_PARAM)
  {
    ShowError("Detour invalid param\n");
  }
  else if(status & DT_OUT_OF_NODES)
  {
    ShowError("Detour out of nodes\n");
  }
  else if(status & DT_PARTIAL_RESULT)
  {
    ShowError("Detour partial result\n");
  }
}

void CNavMesh::unload()
{
  if(m_navMesh != NULL){
    delete m_navMesh;
  }
}

int16 CNavMesh::findPath(position_t start, position_t end, position_t* path, uint16 pathSize)
{

  dtStatus status;

  float spos[3];
  spos[0] = start.x;
  spos[1] = start.y * -1;
  spos[2] = start.z * -1;

  float epos[3];
  epos[0] = end.x;
  epos[1] = end.y * -1;
  epos[2] = end.z * -1;

  dtQueryFilter filter;
  filter.setIncludeFlags(0xffff);
  filter.setExcludeFlags(0);

  float polyPickExt[3];
  polyPickExt[0] = 10;
  polyPickExt[1] = 20;
  polyPickExt[2] = 10;

  dtPolyRef startRef;
  dtPolyRef endRef;

  dtPolyRef nearestRef;
  float enearest[3];
  float snearest[3];

  status = m_navMeshQuery->findNearestPoly(spos, polyPickExt, &filter, &startRef, snearest);

  if(dtStatusFailed(status))
  {
    ShowError("CNavMesh::findPath start point invalid (%f, %f, %f)\n", spos[0], spos[1], spos[2]);
    outputError(status);
    return ERROR_NEARESTPOLY;
  }

  status = m_navMeshQuery->findNearestPoly(epos, polyPickExt, &filter, &endRef, enearest);

  if(dtStatusFailed(status))
  {
    ShowError("CNavMesh::findPath end point invalid (%f, %f, %f)\n", epos[0], epos[1], epos[2]);
    outputError(status);
    return ERROR_NEARESTPOLY;
  }

  if (!m_navMesh->isValidPolyRef(startRef) || !m_navMesh->isValidPolyRef(endRef))
  {
    ShowError("CNavMesh::findPath Couldn't find path (%f, %f, %f)->(%f, %f, %f) \n", start.x, start.y, start.z, end.x, end.y, end.z);
    return ERROR_NEARESTPOLY;
  }

  dtPolyRef m_polys[MAX_NAV_POLYS];
  int npolys;
  float straightPath[MAX_NAV_POLYS*3];
  unsigned char straightPathFlags[MAX_NAV_POLYS];
  dtPolyRef straightPathPolys[MAX_NAV_POLYS];
  int nstraightPath = 0;

  int16 pos = 0;

  // not sure what this is for?
  int32 pathCount = 0;

  status = m_navMeshQuery->findPath(startRef, endRef, snearest, enearest, &filter, m_polys, &pathCount, MAX_NAV_POLYS);

  if(dtStatusFailed(status))
  {
    ShowError("CNavMesh::findPath findPath error\n");
    outputError(status);
    return -1;
  }

  if (pathCount > 0)
  {

    int32 straightPathCount = MAX_NAV_POLYS * 3;

    status = m_navMeshQuery->findStraightPath(snearest, enearest, m_polys, pathCount, straightPath, straightPathFlags, straightPathPolys, &straightPathCount, MAX_NAV_POLYS);

    if(dtStatusFailed(status))
    {
      ShowError("CNavMesh::findPath findStraightPath error\n");
      outputError(status);
      return -1;
    }

    // i starts at 3 so the start position is ignored
    for ( int i = 3; i < straightPathCount*3; )
    {
      path[pos].x = straightPath[i++];
      path[pos].y = straightPath[i++] * -1;
      path[pos].z = straightPath[i++] * -1;
      pos++;

      if(pos == pathSize)
      {
        ShowError("CNavMesh::findPath Path is too long to hold in array!\n");
        break;
      }
    }

  }

  return pos;
}

int16 CNavMesh::findRandomPath(position_t start, float maxRadius, position_t* path, uint16 pathSize)
{

  dtStatus status;
  int16 length = 0;

  float spos[3];
  spos[0] = start.x;
  spos[1] = start.y * -1;
  spos[2] = start.z * -1;

  float polyPickExt[3];
  polyPickExt[0] = 30;
  polyPickExt[1] = 60;
  polyPickExt[2] = 30;

  float randomPt[3];
  float snearest[3];

  dtQueryFilter filter;
  filter.setIncludeFlags(0xffff);
  filter.setExcludeFlags(0);

  dtPolyRef startRef;
  dtPolyRef randomRef;

  status = m_navMeshQuery->findNearestPoly(spos, polyPickExt, &filter, &startRef, snearest);

  if(dtStatusFailed(status))
  {
    ShowError("CNavMesh::findRandomPath start point invalid (%f, %f, %f)\n", spos[0], spos[1], spos[2]);
    outputError(status);
    return ERROR_NEARESTPOLY;
  }

  status = m_navMeshQuery->findRandomPointAroundCircle(startRef, spos, maxRadius, &filter, &RandomNumber, &randomRef, randomPt);

  if(dtStatusFailed(status))
  {
    ShowError("CNavMesh::findRandomPath Error\n");
    outputError(status);
    return ERROR_NEARESTPOLY;
  }

  position_t end;

  end.x = randomPt[0];
  end.y = randomPt[1] * -1;
  end.z = randomPt[2] * -1;

  return findPath(start, end, path, pathSize);
}

bool CNavMesh::test(uint16 zoneId)
{
  position_t path[30];
  int8 size = 30;
  position_t start;
  position_t end;

  if(zoneId == 100)
  {
    // west ronfaure
    start.x = -224;
    start.y = 60;
    start.z = -316;

    end.x = -224;
    end.y = 60;
    end.z = -324;
  }

  end.y *= -1.0f;
  end.z *= -1.0f;

  start.y *= -1.0f;
  start.z *= -1.0f;

  int8 totalLength = findPath(start, end, path, size);

  if(totalLength > 1)
  {
    if(end.x != path[totalLength-1].x || end.z != path[totalLength-1].z){
      ShowError("CNavMesh::test Zone (%d) Failed end points do not match\n", zoneId);
      return false;
    }
  }
  else
  {
    ShowError("CNavMesh::test Zone (%d) Failed path could not be created\n", zoneId);
    return false;
  }
  return true;
}
