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
The PathFind class provides an interface for getting an entity to a destination. It will find a path from a navmesh and carry it out.
*/
#ifndef _PATHFIND_H
#define _PATHFIND_H

#include "../common/showmsg.h"
#include "../common/mmo.h"

class CBattleEntity;

// no path can be longer than this
#define MAX_PATH_POINTS 15

class CPathFind
{
  public:
    CPathFind(CBattleEntity* PTarget);
    ~CPathFind();

    // move to a random point around given point
    bool RoamAround(position_t point, uint8 roamFlags);

    // run twice as fast to point
    // used for chasing
    bool RunTo(position_t point);

    // walk normally to a point
    // used for pets roaming with master
    bool WalkTo(position_t point);

    bool KnockBack(position_t point, float power);

    // moves mob to next point
    void FollowPath();

    // tells entity to take one step towards position
    void StepTo(position_t* pos);

    // moves the targets pet near the given point
    void PetStepTo(position_t* pos);

    // checks if mob is currently following a path
    bool IsFollowingPath();

    // calculate speed of mob with mode, mod_speed, etc
    float GetRealSpeed();

    // clear current path
    void Clear();
    bool isNavMeshAvailable();

    // checks if mob is at given point
    bool AtPoint(position_t* pos);

  private:

    // find a valid path using polys
    bool FindPath(position_t* start, position_t* end);

    // cut some corners and find the fastest path
    // this will make the mob run down cliffs
    bool FindClosestPath(position_t* start, position_t* end);

    // finds a random path around the given point
    bool FindRandomPath(position_t* start, float maxRadius);

    CBattleEntity* m_PTarget;
    position_t m_points[MAX_PATH_POINTS];
    position_t* m_PTargetPoint;

    int16 m_currentPoint;
    int16 m_pathLength;
    int8 m_mode;
};

#endif