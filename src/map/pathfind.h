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

class CBaseEntity;

// no path can be longer than this
#define MAX_PATH_POINTS 50

enum PATHFLAG {
  PATHFLAG_NONE = 0,
  PATHFLAG_RUN = 1, // run twice the speed
  PATHFLAG_WALLHACK = 2, // run through walls if path is too long
  PATHFLAG_REVERSE = 4// reverse the path
};

class CPathFind
{
  public:
    CPathFind(CBaseEntity* PTarget);
    ~CPathFind();

    // move to a random point around given point
    bool RoamAround(position_t point, uint8 roamFlags);

    // find and walk to the given point
    bool PathTo(position_t point, uint8 pathFlags);

    // walk through the given points. No new points made.
    bool PathThrough(position_t* points, uint8 totalPoints, uint8 pathFlags);

    // instantly moves an entity to the point
    // this will make sure you're not in a wall
    bool WarpTo(position_t point);

    // this will push the entity backwards by the given power
    bool Knockback(position_t from, float power);

    // moves mob to next point
    void FollowPath();

    // returns true if entity is on a way point
    bool OnPoint();

    // returns last point in path target was that
    position_t* GetLastPoint();

    // stops pathfinding after moving the given distance
    // this can be used to prevent mobs from walking
    // all the way to a point
    void LimitDistance(float maxDistance);

    // tells entity to take one step towards position
    void StepTo(position_t* pos, bool run = false);

    // checks if mob is currently following a path
    bool IsFollowingPath();

    // calculate speed of mob with mode, mod_speed, etc
    float GetRealSpeed();

    // look at the given point
    void LookAt(position_t point);

    // clear current path
    void Clear();
    bool isNavMeshEnabled();

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

    void AddPoints(position_t* points, uint8 totalPoints, bool reverse = false);

    CBaseEntity* m_PTarget;
    position_t m_points[MAX_PATH_POINTS];
    position_t* m_PLastPoint;

    uint8 m_pathFlags;
    bool m_onPoint;
    int16 m_currentPoint;
    int16 m_pathLength;

    float m_distanceMoved;
    float m_maxDistance;
};

#endif
