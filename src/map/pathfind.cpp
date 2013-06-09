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

CPathFind::CPathFind(CBattleEntity* PTarget)
{
  m_PTarget = PTarget;
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

  if(NavMeshAvailable())
  {

    position_t start = m_PTarget->loc.p;
    position_t end = m_PTarget->loc.p;

    end.x = end.x + rand()%20 + rand()%-20;
    end.z = end.z + rand()%20 + rand()%-20;

    m_pathLength = m_PTarget->loc.zone->m_navMesh->findPath(start, end, m_points, MAX_PATH_POINTS);
    m_currentPoint = 0;

    if(m_pathLength <= 0)
    {
      ShowError("CPathFind::RoamAround Path could not be found\n");
      return false;
    }

    // for(int8 i=0; i<MAX_PATH_POINTS; i++)
    // {
    //   if(m_points[i].x != 0)
    //     ShowDebug("CPathFind::RoamAround points found (%f, %f, %f)\n", m_points[i].x, m_points[i].y, m_points[i].z);
    // }

  }

  return true;
}

bool CPathFind::MoveTo(position_t point)
{
  ShowError("MoveTo not implemented\n");
}

bool CPathFind::NavMeshAvailable()
{
  return m_PTarget->loc.zone && m_PTarget->loc.zone->m_navMesh != NULL;
}

void CPathFind::Step()
{
  if(!IsFollowingPath()) return;

  // move mob to next point
  position_t* nextPoint = &m_points[m_currentPoint]

  // check if i'm close enough to next point
  // TODO: find real speed with mode and speed mod
  if(distance(m_PTarget->loc.p, *nextPoint) <= m_PTarget->speed)
  {
    m_PTarget->loc.p.x = nextPoint.x;
    m_PTarget->loc.p.y = nextPoint.y;
    m_PTarget->loc.p.z = nextPoint.z;
  }
  else
  {

  }

  m_currentPoint++;

  if(m_currentPoint >= m_pathLength)
  {
    // i'm finished!
    Clear();
  }
}

void CPathFind::MoveTo(position_t* pos)
{

  uint8 angle = getangle(PPursuer->loc.p, PTarget->loc.p);
  PPursuer->loc.p.rotation = angle;
  /*
  if (m_PTarget->speed != 0)
  {
    float angle = (1 - (float)m_PTarget->loc.p.rotation / 255) * 6.28318f;

        m_PTarget->loc.p.x += (cosf(angle) * ((float)(m_PTarget->speed * (1+(m_PTarget->getMod(MOD_MOVE) / 100.0f))) / 0x28) * (mode) * 1.08);

    m_PTarget->loc.p.y = pos.y;

        m_PTarget->loc.p.z += (sinf(angle) * ((float)(m_PTarget->speed * (1+(m_PTarget->getMod(MOD_MOVE) / 100.0f))) / 0x28) * (mode) * 1.08);

    m_PTarget->loc.p.moving += ((0x36*((float)m_PTarget->speed/0x28)) - (0x14*(mode - 1)));

    if(m_PTarget->loc.p.moving > 0x2fff)
    {
      m_PTarget->loc.p.moving = 0;
    }
  }*/
}

bool CPathFind::IsFollowingPath()
{
  return m_pathLength > 0;
}

void CPathFind::Clear()
{
  m_pathLength = 0;
  m_currentPoint = 0;
  m_mode = 0;
}