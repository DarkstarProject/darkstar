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

#include "pathfind.h"
#include "zone.h"
#include "battleentity.h"
#include "mobentity.h"

CPathFind::CPathFind(CBattleEntity* PTarget)
{
  m_PTarget = PTarget;
  m_PTargetPoint = NULL;
}

CPathFind::~CPathFind()
{
  m_PTarget = NULL;
  Clear();
}

bool CPathFind::RoamAround(position_t point, uint8 roamFlags)
{
  Clear();

  // walk normal speed
  m_mode = 1;

  if(GetRealSpeed() == 0 || m_PTarget->objtype != TYPE_MOB)
  {
    return false;
  }

  if(NavMeshAvailable())
  {

    position_t start = m_PTarget->loc.p;

    // roam around my spawn point
    position_t end = ((CMobEntity*)m_PTarget)->m_SpawnPoint;

    float t = 2.0f * M_PI * ((double) rand() / (RAND_MAX));
    float u = ((double) rand() / (RAND_MAX)) + ((float) rand() / (RAND_MAX));

    if(u > 1){
      u = u - 2;
    }

    float maxDistance = 30.0f;
    float r = u * maxDistance;

    end.x += r * cosf(t);
    end.z += r * sinf(t);

    m_pathLength = m_PTarget->loc.zone->m_navMesh->findPath(start, end, m_points, MAX_PATH_POINTS);
    m_currentPoint = 0;

    // ShowDebug("CPathFind::RoamAround Total Path Length (%d)\n", m_pathLength);

    if(m_pathLength <= 0)
    {
      Clear();
      return false;
    }

  }

  return true;
}

bool CPathFind::RunTo(position_t point)
{
  m_mode = 2;
  ShowError("RunTo not implemented\n");
}

bool CPathFind::WalkTo(position_t point)
{
  m_mode = 1;
  ShowError("WalkTo not implemented\n");
}

bool CPathFind::KnockBack(position_t from, float power)
{
  // pushes entity back from the given position
}

bool CPathFind::NavMeshAvailable()
{
  return m_PTarget->loc.zone && m_PTarget->loc.zone->m_navMesh != NULL;
}

void CPathFind::FollowPath()
{
  if(!IsFollowingPath()) return;

  // move mob to next point
  m_PTargetPoint = &m_points[m_currentPoint];

  StepTo(m_PTargetPoint);

  if(AtPoint(m_PTargetPoint))
  {
    m_currentPoint++;

    if(m_currentPoint >= m_pathLength)
    {
      // i'm finished!
      Clear();
    }
  }
}

void CPathFind::StepTo(position_t* pos)
{

  float speed = GetRealSpeed();

  // face point mob is moving towards
  m_PTarget->loc.p.rotation = getangle(m_PTarget->loc.p, *pos);

  // if i'm going to overshoot the checkpoint just put me there
  if(distance(m_PTarget->loc.p, *pos) < speed)
  {
    m_PTarget->loc.p.x = pos->x;
    m_PTarget->loc.p.y = pos->y;
    m_PTarget->loc.p.z = pos->z;
  }
  else
  {
    // take a step towards target point
    float radians = (1 - (float)m_PTarget->loc.p.rotation / 255) * 6.28318f;

    m_PTarget->loc.p.x += cosf(radians) * speed;

    m_PTarget->loc.p.y = pos->y;

    m_PTarget->loc.p.z += sinf(radians) * speed;

  }

  m_PTarget->loc.p.moving += ((0x36*((float)speed/0x28)) - (0x14*(m_mode - 1)));

  if(m_PTarget->loc.p.moving > 0x2fff)
  {
    m_PTarget->loc.p.moving = 0;
  }

}

float CPathFind::GetRealSpeed()
{
  return ((float)(m_PTarget->speed * (1+(m_PTarget->getMod(MOD_MOVE) / 100.0f))) / 0x28) * (m_mode) * 1.08;
}

bool CPathFind::IsFollowingPath()
{
  return m_pathLength > 0;
}

bool CPathFind::AtPoint(position_t* pos)
{
  return m_PTarget->loc.p.x == pos->x && m_PTarget->loc.p.z == pos->z;
}

void CPathFind::Clear()
{
  m_pathLength = 0;
  m_currentPoint = 0;
  m_mode = 0;
}