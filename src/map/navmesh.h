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

/*
The NavMesh class will load and find paths given a start point and end point.
*/
#ifndef _NAVMESH_H
#define _NAVMESH_H

#include "../common/detour/DetourNavMesh.h"
#include "../common/detour/DetourNavMeshQuery.h"

#include "../common/showmsg.h"
#include "../common/mmo.h"

#define MAX_NAV_POLYS 256

static const int NAVMESHSET_MAGIC = 'M'<<24 | 'S'<<16 | 'E'<<8 | 'T'; //'MSET';
static const int NAVMESHSET_VERSION = 1;

struct NavMeshSetHeader
{
  int magic;
  int version;
  int numTiles;
  dtNavMeshParams params;
};

struct NavMeshTileHeader
{
  dtTileRef tileRef;
  int dataSize;
};

class CNavMesh
{
  public:
    static const int8 ERROR_NEARESTPOLY = -2;

  public:
    CNavMesh();
    ~CNavMesh();

    bool load(char* path);
    void unload();

    int16 findPath(position_t start, position_t end, position_t* path, uint16 pathSize);
    int16 findRandomPath(position_t start, float maxRadius, position_t* path, uint16 pathSize);

    // returns true if end point can be seen from start point
    bool canSeePoint(position_t start, position_t end);

    // returns true if the point is in water
    bool inWater(position_t point);

    // validate the integrity of the navmesh
    bool test(uint16 zoneId);

  private:
    void outputError(uint32 status);

    dtNavMesh* m_navMesh;
    dtNavMeshQuery* m_navMeshQuery;
    char* path;
};

#endif
