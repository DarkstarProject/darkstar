/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

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
#include <float.h>
#include <string.h>
#include "../common/utils.h"
#include "../common/dsprand.h"

void CNavMesh::ToFFXIPos(position_t* pos, float* out) {
    float y = pos->y;
    float z = pos->z;

    out[0] = pos->x;
    out[1] = y * -1;
    out[2] = z * -1;

}

void CNavMesh::ToFFXIPos(float* out) {
    float y = out[1];
    float z = out[2];

    out[1] = y * -1;
    out[2] = z * -1;

}

void CNavMesh::ToFFXIPos(position_t* out) {
    float y = out->y;
    float z = out->z;

    out->y = y * -1;
    out->z = z * -1;
}

void CNavMesh::ToDetourPos(float* out) {
    float y = out[1];
    float z = out[2];

    out[1] = y * -1;
    out[2] = z * -1;

}

void CNavMesh::ToDetourPos(position_t* out) {
    float y = out->y;
    float z = out->z;

    out->y = y * -1;
    out->z = z * -1;

}

void CNavMesh::ToDetourPos(position_t* pos, float* out) {
    float y = pos->y;
    float z = pos->z;

    out[0] = pos->x;
    out[1] = y * -1;
    out[2] = z * -1;

}

CNavMesh::CNavMesh(uint16 zoneID)
{
    m_zoneID = zoneID;
    m_navMesh = nullptr;
    m_hit.path = m_hitPath;
    m_hit.maxPath = 20;
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
        return false;
    }

    // Read header.
    NavMeshSetHeader header;
    fread(&header, sizeof(NavMeshSetHeader), 1, fp);
    if (header.magic != NAVMESHSET_MAGIC)
    {
        fclose(fp);
        return false;
    }
    if (header.version != NAVMESHSET_VERSION)
    {
        fclose(fp);
        return false;
    }

    m_navMesh = dtAllocNavMesh();
    if (!m_navMesh)
    {
        fclose(fp);
        return false;
    }

    dtStatus status = m_navMesh->init(&header.params);
    if (dtStatusFailed(status))
    {
        ShowNavError("CNavMesh::load Could not initialize detour for (%s)", path);
        outputError(status);
        fclose(fp);
        return false;
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

    if (dtStatusFailed(status))
    {
        ShowNavError("CNavMesh::load Error loading navmeshquery (%s)\n", path);
        outputError(status);
        return false;
    }

    return true;
}

void CNavMesh::outputError(uint32 status)
{

    if (status & DT_WRONG_MAGIC)
    {
        ShowNavError("Detour wrong magic\n");
    }
    else if (status & DT_WRONG_VERSION)
    {
        ShowNavError("Detour wrong version\n");
    }
    else if (status & DT_OUT_OF_MEMORY)
    {
        ShowNavError("Detour out of memory\n");
    }
    else if (status & DT_INVALID_PARAM)
    {
        ShowNavError("Detour invalid param\n");
    }
    else if (status & DT_OUT_OF_NODES)
    {
        ShowNavError("Detour out of nodes\n");
    }
    else if (status & DT_PARTIAL_RESULT)
    {
        ShowNavError("Detour partial result\n");
    }
}

void CNavMesh::unload()
{
    if (m_navMesh != nullptr) {
        delete m_navMesh;
    }
}

int16 CNavMesh::findPath(position_t start, position_t end, position_t* path, uint16 pathSize)
{

    dtStatus status;

    float spos[3];
    CNavMesh::ToDetourPos(&start, spos);
    // ShowDebug("start pos %f %f %f\n", spos[0], spos[1], spos[2]);

    float epos[3];
    CNavMesh::ToDetourPos(&end, epos);
    // ShowDebug("end pos %f %f %f\n", epos[0], epos[1], epos[2]);

    dtQueryFilter filter;
    filter.setIncludeFlags(0xffff);
    filter.setExcludeFlags(0);

    float polyPickExt[3];
    polyPickExt[0] = 10;
    polyPickExt[1] = 20;
    polyPickExt[2] = 10;

    dtPolyRef startRef;
    dtPolyRef endRef;

    float enearest[3];
    float snearest[3];

    status = m_navMeshQuery->findNearestPoly(spos, polyPickExt, &filter, &startRef, snearest);

    if (dtStatusFailed(status))
    {
        ShowNavError("CNavMesh::findPath start point invalid (%f, %f, %f) (%u)\n", spos[0], spos[1], spos[2], m_zoneID);
        outputError(status);
        return ERROR_NEARESTPOLY;
    }

    status = m_navMeshQuery->findNearestPoly(epos, polyPickExt, &filter, &endRef, enearest);

    if (dtStatusFailed(status))
    {
        ShowNavError("CNavMesh::findPath end point invalid (%f, %f, %f) (%u)\n", epos[0], epos[1], epos[2], m_zoneID);
        outputError(status);
        return ERROR_NEARESTPOLY;
    }

    if (!m_navMesh->isValidPolyRef(startRef) || !m_navMesh->isValidPolyRef(endRef))
    {
        ShowNavError("CNavMesh::findPath Couldn't find path (%f, %f, %f)->(%f, %f, %f) (%u) \n", start.x, start.y, start.z, end.x, end.y, end.z, m_zoneID);
        return ERROR_NEARESTPOLY;
    }

    dtPolyRef m_polys[MAX_NAV_POLYS];
    float straightPath[MAX_NAV_POLYS * 3];
    unsigned char straightPathFlags[MAX_NAV_POLYS];
    dtPolyRef straightPathPolys[MAX_NAV_POLYS];
    int nstraightPath = 0;

    int16 pos = 0;

    // not sure what this is for?
    int32 pathCount = 0;

    status = m_navMeshQuery->findPath(startRef, endRef, snearest, enearest, &filter, m_polys, &pathCount, MAX_NAV_POLYS);

    if (dtStatusFailed(status))
    {
        ShowNavError("CNavMesh::findPath findPath error (%u)\n", m_zoneID);
        outputError(status);
        return -1;
    }

    if (pathCount > 0)
    {

        int32 straightPathCount = MAX_NAV_POLYS * 3;

        status = m_navMeshQuery->findStraightPath(snearest, enearest, m_polys, pathCount, straightPath, straightPathFlags, straightPathPolys, &straightPathCount, MAX_NAV_POLYS);

        if (dtStatusFailed(status))
        {
            ShowNavError("CNavMesh::findPath findStraightPath error (%u)\n", m_zoneID);
            outputError(status);
            return -1;
        }

        // i starts at 3 so the start position is ignored
        for (int i = 3; i < straightPathCount * 3; )
        {
            float pathPos[3];
            pathPos[0] = straightPath[i++];
            pathPos[1] = straightPath[i++];
            pathPos[2] = straightPath[i++];

            CNavMesh::ToFFXIPos(pathPos);

            path[pos].x = pathPos[0];
            path[pos].y = pathPos[1];
            path[pos].z = pathPos[2];
            pos++;

            if (pos == pathSize)
            {
                ShowNavError("CNavMesh::findPath Path is too long to hold in array!\n");
                break;
            }
        }

    }

    return pos;
}

int16 CNavMesh::findRandomPosition(position_t start, float maxRadius, position_t* randomPosition)
{

    dtStatus status;
    int16 length = 0;

    float spos[3];
    CNavMesh::ToDetourPos(&start, spos);

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

    if (dtStatusFailed(status))
    {
        ShowNavError("CNavMesh::findRandomPath start point invalid (%f, %f, %f) (%u)\n", spos[0], spos[1], spos[2], m_zoneID);
        outputError(status);
        return ERROR_NEARESTPOLY;
    }

    if (!m_navMesh->isValidPolyRef(startRef))
    {
        ShowNavError("CNavMesh::findRandomPath startRef is invalid (%f, %f, %f) (%u)\n", start.x, start.y, start.z, m_zoneID);
        return ERROR_NEARESTPOLY;
    }

    status = m_navMeshQuery->findRandomPointAroundCircle(startRef, spos, maxRadius, &filter, []() -> float { return dsprand::GetRandomNumber(1.f); }, &randomRef, randomPt);

    if (dtStatusFailed(status))
    {
        ShowNavError("CNavMesh::findRandomPath Error (%u)\n", m_zoneID);
        outputError(status);
        return ERROR_NEARESTPOLY;
    }

    CNavMesh::ToFFXIPos(randomPt);
    randomPosition->x = randomPt[0];
    randomPosition->y = randomPt[1];
    randomPosition->z = randomPt[2];

    return 0;
}

bool CNavMesh::inWater(position_t point)
{
    // TODO:
    return false;
}

bool CNavMesh::validPosition(position_t position)
{
    float spos[3];
    CNavMesh::ToDetourPos(&position, spos);

    float polyPickExt[3];
    polyPickExt[0] = 30;
    polyPickExt[1] = 60;
    polyPickExt[2] = 30;

    float snearest[3];

    dtQueryFilter filter;
    filter.setIncludeFlags(0xffff);
    filter.setExcludeFlags(0);

    dtPolyRef startRef;

    dtStatus status = m_navMeshQuery->findNearestPoly(spos, polyPickExt, &filter, &startRef, snearest);

    if (dtStatusFailed(status))
    {
        return false;
    }

    return m_navMesh->isValidPolyRef(startRef);
}

bool CNavMesh::raycast(position_t& start, position_t& end)
{
    if (start.x == end.x && start.y == end.y && start.z == end.z)
        return true;
    dtStatus status;

    float spos[3];
    CNavMesh::ToDetourPos(&start, spos);

    float epos[3];
    CNavMesh::ToDetourPos(&end, epos);

    float polyPickExt[3];
    polyPickExt[0] = 30;
    polyPickExt[1] = 60;
    polyPickExt[2] = 30;

    float snearest[3];

    dtQueryFilter filter;
    filter.setIncludeFlags(0xffff);
    filter.setExcludeFlags(0);

    dtPolyRef startRef;

    status = m_navMeshQuery->findNearestPoly(spos, polyPickExt, &filter, &startRef, snearest);

    if (dtStatusFailed(status))
    {
        ShowNavError("CNavMesh::raycastPoint start point invalid (%f, %f, %f) (%u)\n", spos[0], spos[1], spos[2], m_zoneID);
        outputError(status);
        return true;
    }

    if (!m_navMesh->isValidPolyRef(startRef))
    {
        ShowNavError("CNavMesh::raycastPoint startRef is invalid (%f, %f, %f) (%u)\n", start.x, start.y, start.z, m_zoneID);
        return true;
    }

    status = m_navMeshQuery->raycast(startRef, spos, epos, &filter, 0, &m_hit);

    if (dtStatusFailed(status))
    {
        ShowNavError("CNavMesh::raycastPoint raycast failed (%f, %f, %f)->(%f, %f, %f) (%u)\n", spos[0], spos[1], spos[2], epos[0], epos[1], epos[2], m_zoneID);
        outputError(status);
        return true;
    }

    // no wall was hit
    if (m_hit.t == FLT_MAX)
    {
        return true;
    }

    return false;
}
