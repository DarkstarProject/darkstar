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

  CMobEntity* PMob = (CMobEntity*)m_PTarget;

  if(isNavMeshAvailable())
  {

    position_t start = m_PTarget->loc.p;

    // roam around my spawn point
    position_t end = PMob->m_SpawnPoint;

    // this will find a random point around the given point
    float t = 2.0f * M_PI * ((double) rand() / (RAND_MAX));
    float u = ((double) rand() / (RAND_MAX)) + ((float) rand() / (RAND_MAX));

    if(u > 1){
      u = u - 2;
    }

    // all mobs will default to this distance
    float minDistance = 5.0f;
    float maxDistance = 10.0f + minDistance;

    // sight aggro mobs will move a bit farther
    // this is until this data is put in the database
    if(PMob->m_Behaviour != BEHAVIOUR_NONE)
    {
      minDistance = 10.0f;
      maxDistance = 10.0f + minDistance;
    }

    float r = u * maxDistance + minDistance;

    end.x += r * cosf(t);
    end.z += r * sinf(t);

    m_pathLength = m_PTarget->loc.zone->m_navMesh->findPath(start, end, m_points, MAX_PATH_POINTS);

    if(m_pathLength <= 0)
    {
      Clear();
      return false;
    }

  }
  else
  {
    // ew, we gotta use the old way

    m_pathLength = 1;

    m_points[0].x = PMob->m_SpawnPoint.x - 1 + rand()%2;
    m_points[0].y = PMob->m_SpawnPoint.y;
    m_points[0].z = PMob->m_SpawnPoint.z - 1 + rand()%2;

  }

  return true;
}

bool CPathFind::RunTo(position_t point)
{
  m_mode = 2;
  ShowError("RunTo not implemented\n");
  return false;
}

bool CPathFind::WalkTo(position_t point)
{
  m_mode = 1;
  ShowError("WalkTo not implemented\n");
  return false;
}

bool CPathFind::KnockBack(position_t from, float power)
{
  // pushes entity back from the given position
	return false;
}

bool CPathFind::isNavMeshAvailable()
{
  return m_PTarget->loc.zone && m_PTarget->loc.zone->m_navMesh != NULL;
}

void CPathFind::FollowPath()
{
  if(!IsFollowingPath()) return;

  // move mob to next point
  m_PTargetPoint = &m_points[m_currentPoint];

  StepTo(m_PTargetPoint);
  PetStepTo(m_PTargetPoint);

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

  m_PTarget->loc.p.moving += ((0x36*((float)m_PTarget->speed/0x28)) - (0x14*(m_mode - 1)));

  if(m_PTarget->loc.p.moving > 0x2fff)
  {
    m_PTarget->loc.p.moving = 0;
  }

}

void CPathFind::PetStepTo(position_t* pos)
{

  // only works for mob pets
  if(m_PTarget->PPet == NULL || m_PTarget->PPet->PBattleAI->GetCurrentAction() != ACTION_ROAMING) return;

  position_t targetPoint = nearPosition(*pos, 2.0f, M_PI);

  m_PTarget->PPet->PBattleAI->MoveTo(&targetPoint);
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