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
  Clear();
}

CPathFind::~CPathFind()
{
  m_PTarget = NULL;
  Clear();
}

bool CPathFind::RoamAround(position_t point, uint8 roamFlags)
{
  Clear();

  if(m_PTarget->speed == 0 || m_PTarget->objtype != TYPE_MOB)
  {
    return false;
  }

  // walk normal speed
  m_mode = 1;

  CMobEntity* PMob = (CMobEntity*)m_PTarget;

  if(isNavMeshAvailable())
  {

    // all mobs will default to this distance
    float maxRadius = 10.0f;

    // sight aggro mobs will move a bit farther
    // this is until this data is put in the database
    if(PMob->m_Behaviour != BEHAVIOUR_NONE)
    {
      maxRadius = 20.0f;
    }

    return FindRandomPath(&PMob->m_SpawnPoint, maxRadius);

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
  Clear();

  if(m_PTarget->speed == 0) return false;

  m_mode = 2;

  if(isNavMeshAvailable())
  {
    return FindClosestPath(&m_PTarget->loc.p, &point);
  }
  else
  {
    m_pathLength = 1;

    m_points[0].x = point.x;
    m_points[0].y = point.y;
    m_points[0].z = point.z;
  }

  return true;
}

bool CPathFind::WalkTo(position_t point)
{
  Clear();

  if(m_PTarget->speed == 0) return false;

  m_mode = 1;
  ShowError("WalkTo not implemented\n");
  return false;
}

bool CPathFind::WarpTo(position_t point)
{
  Clear();

  position_t newPoint = nearPosition(point, 2.0f, M_PI);

  m_PTarget->loc.p.x = newPoint.x;
  m_PTarget->loc.p.y = newPoint.y;
  m_PTarget->loc.p.z = newPoint.z;
  m_PTarget->loc.p.moving = 0;

  LookAt(point);

  return true;
}

bool CPathFind::Knock(position_t from, float power)
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
  position_t* targetPoint = &m_points[m_currentPoint];

  StepTo(targetPoint);
  PetStepTo(targetPoint);

  if(AtPoint(targetPoint))
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
  LookAt(*pos);

  // if i'm going to overshoot the checkpoint just put me there
  if(distance(m_PTarget->loc.p, *pos) <= speed)
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

bool CPathFind::FindPath(position_t* start, position_t* end)
{

  m_pathLength = m_PTarget->loc.zone->m_navMesh->findPath(*start, *end, m_points, MAX_PATH_POINTS);

  if(m_pathLength <= 0)
  {
    ShowError("CPathFind::FindPath Entity (%d) could not find path", m_PTarget->id);
    Clear();
    return false;
  }

  return true;
}

bool CPathFind::FindRandomPath(position_t* start, float maxRadius)
{

  m_pathLength = m_PTarget->loc.zone->m_navMesh->findRandomPath(*start, maxRadius, m_points, MAX_PATH_POINTS);

  if(m_pathLength <= 0)
  {
    ShowError("CPathFind::FindRandomPath Entity (%d) could not find path", m_PTarget->id);
    Clear();
    return false;
  }

  return true;
}

bool CPathFind::FindClosestPath(position_t* start, position_t* end)
{

  m_pathLength = m_PTarget->loc.zone->m_navMesh->findPath(*start, *end, m_points, MAX_PATH_POINTS);

  if(m_pathLength <= 0 || m_pathLength >= 6)
  {
    // f you, too long
    // this is a trick to make mobs go up / down impassible terrain
    m_pathLength = 1;

    m_points[0].x = end->x;
    m_points[0].y = end->y;
    m_points[0].z = end->z;
  }

  return true;
}

void CPathFind::LookAt(position_t point)
{
  m_PTarget->loc.p.rotation = getangle(m_PTarget->loc.p, point);
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