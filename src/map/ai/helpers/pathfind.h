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

/*
The PathFind class provides an interface for getting an entity to a destination. It will find a path from a navmesh and carry it out.
*/
#ifndef _PATHFIND_H
#define _PATHFIND_H

#include "../../../common/showmsg.h"
#include "../../../common/mmo.h"

class CBaseEntity;

// no path can be longer than this
#define MAX_PATH_POINTS 50
#define MAX_TURN_POINTS 5
#define VERTICAL_PATH_LIMIT 3.5

enum PATHFLAG {
  PATHFLAG_NONE			= 0x00,
  PATHFLAG_RUN			= 0x01, // run twice the speed
  PATHFLAG_WALLHACK		= 0x02, // run through walls if path is too long
  PATHFLAG_REVERSE		= 0x04, // reverse the path
  PATHFLAG_SCRIPT		= 0x08	// don't overwrite this path before completion (except via another script)
};

class CPathFind
{
  public:
    CPathFind(CBaseEntity* PTarget);
    ~CPathFind();

    // move to a random point around given point
    bool RoamAround(position_t point, float maxRadius, uint8 maxTurns, uint8 roamFlags = 0);

    // find and walk to the given point
    bool PathTo(position_t point, uint8 pathFlags = 0);

    // move some where around the point
    bool PathAround(position_t point, float distance, uint8 pathFlags = 0);

    // walk through the given points. No new points made.
    bool PathThrough(position_t* points, uint8 totalPoints, uint8 pathFlags = 0);

    // instantly moves an entity to the point
    // this will make sure you're not in a wall
    bool WarpTo(position_t point, float maxDistance = 2.0f);

    // moves mob to next point
    void FollowPath();

    // returns true if entity is on a way point
    bool OnPoint();

    // stops pathfinding after moving the given distance
    // this can be used to prevent mobs from walking
    // all the way to a point
    void LimitDistance(float maxDistance);

    // will only get this close towards the final point
    // useful to stop mobs from walking too close to players
    void StopWithin(float within);

    // tells entity to take one step towards position
    void StepTo(position_t* pos, bool run = false);

    // checks if mob is currently following a path
    bool IsFollowingPath();
	bool IsFollowingScriptedPath();

    // calculate speed of mob with mode, mod_speed, etc
    float GetRealSpeed();

    // look at the given point
    void LookAt(position_t point);

    // clear current path
    void Clear();
    bool isNavMeshEnabled();

    bool ValidPosition(position_t* pos);

    // checks if mob is at given point
    bool AtPoint(position_t* pos);

    // returns true if i'm in water
    bool InWater();

    // checks if raycast was broken between current point and given
    // returns true if raycast didn't hit any walls
    bool CanSeePoint(position_t point);

  private:

    // find a valid path using polys
    bool FindPath(position_t* start, position_t* end);

    // cut some corners and find the fastest path
    // this will make the mob run down cliffs
    bool FindClosestPath(position_t* start, position_t* end);

    // finds a random path around the given point
    bool FindRandomPath(position_t* start, float maxRadius, uint8 maxTurns, uint8 roamFlags);

    void AddPoints(position_t* points, uint8 totalPoints, bool reverse = false);

    void FinishedPath();

    CBaseEntity* m_PTarget;
    position_t m_points[MAX_PATH_POINTS];
    position_t m_turnPoints[MAX_TURN_POINTS];

    uint8 m_pathFlags;
    uint16 m_roamFlags;
    bool m_onPoint;
    int16 m_currentPoint;
    int16 m_pathLength;

    uint8 m_currentTurn;
    uint8 m_turnLength;

    float m_distanceMoved;
    float m_maxDistance;
};

#endif
