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

#include "pathfind.h"
#include "../../zone.h"
#include "../../entities/baseentity.h"
#include "../../entities/mobentity.h"

CPathFind::CPathFind(CBaseEntity* PTarget)
{
	m_PTarget = PTarget;
	m_pathFlags = 0;
	Clear();
}

CPathFind::~CPathFind()
{
	m_PTarget = nullptr;
	Clear();
}

bool CPathFind::RoamAround(position_t point, float maxRadius, uint8 roamFlags)
{
	Clear();

	m_roamFlags = roamFlags;

	if (isNavMeshEnabled())
	{

		if (FindRandomPath(&point, maxRadius))
		{
			return true;
		}
		else
		{
			Clear();
			return false;
		}
	}
	else
	{

		// no point worm roaming cause it'll move one inch
		if (m_roamFlags & ROAMFLAG_WORM)
		{
			Clear();
			return false;
		}

		// ew, we gotta use the old way
		m_pathLength = 1;

		m_points[0].x = point.x - 1 + rand() % 2;
		m_points[0].y = point.y;
		m_points[0].z = point.z - 1 + rand() % 2;

	}

	return true;
}

bool CPathFind::PathTo(position_t point, uint8 pathFlags)
{
	// don't follow a new path if the current path has script flag and new path doesn't
	if (IsFollowingPath() && m_pathFlags & PATHFLAG_SCRIPT && !(pathFlags & PATHFLAG_SCRIPT))
		return false;
	Clear();

	m_pathFlags = pathFlags;

	if (isNavMeshEnabled())
	{
		bool result = false;

		if (m_pathFlags & PATHFLAG_WALLHACK)
		{
			result = FindClosestPath(&m_PTarget->loc.p, &point);
		}
		else
		{
			result = FindPath(&m_PTarget->loc.p, &point);
		}

		if (!result)
		{
			Clear();
		}

		return result;
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

bool CPathFind::PathAround(position_t point, float distance, uint8 pathFlags)
{

	position_t* lastPoint = &point;

	float randomRadian = WELL512::GetRandomNumber<float>(0,2*M_PI);

	lastPoint->x += cosf(randomRadian) * distance;
	lastPoint->z += sinf(randomRadian) * distance;

	return PathTo(point, pathFlags);
}

bool CPathFind::PathThrough(position_t* points, uint8 totalPoints, uint8 pathFlags)
{

	Clear();

	m_pathFlags = pathFlags;

	AddPoints(points, totalPoints, m_pathFlags & PATHFLAG_REVERSE);

	return true;
}

bool CPathFind::WarpTo(position_t point, float maxDistance)
{
	Clear();

	position_t newPoint = nearPosition(point, maxDistance, M_PI);

	m_PTarget->loc.p.x = newPoint.x;
	m_PTarget->loc.p.y = newPoint.y;
	m_PTarget->loc.p.z = newPoint.z;
	m_PTarget->loc.p.moving = 0;

	LookAt(point);
    m_PTarget->updatemask |= UPDATE_POS;

	return true;
}

bool CPathFind::isNavMeshEnabled()
{
	return m_PTarget->loc.zone && m_PTarget->loc.zone->m_navMesh != nullptr;
}

void CPathFind::LimitDistance(float maxLength)
{
	m_maxDistance = maxLength;
}

void CPathFind::StopWithin(float within)
{
	if (!IsFollowingPath()) return;
	// TODO: cut up path

	position_t* lastPoint = &m_points[m_pathLength - 1];
	position_t* secondLastPoint = nullptr;

	if (m_pathLength == 1)
	{
		secondLastPoint = &m_PTarget->loc.p;
	}
	else
	{
		secondLastPoint = &m_points[m_pathLength - 2];
	}

	float distanceTo = distance(*lastPoint, *secondLastPoint);

	if (distanceTo > within)
	{
		// reduce last point to stop within the given number
		float radians = atanf((secondLastPoint->z - lastPoint->z) / (secondLastPoint->x - lastPoint->x)) * (M_PI / 180.0f);

		lastPoint->x -= cosf(radians) * within;
		lastPoint->z -= sinf(radians) * within;
	}
	else
	{
		// i'm already there, stop moving
		if (m_pathLength == 1)
		{
			Clear();
		}
		else
		{
			// remove last point, it'll make me too close
			m_pathLength--;
		}
	}
}

void CPathFind::FollowPath()
{
	if (!IsFollowingPath()) return;

	m_onPoint = false;

	// move mob to next point
	position_t* targetPoint = &m_points[m_currentPoint];

	StepTo(targetPoint, m_pathFlags & PATHFLAG_RUN);

	if (m_maxDistance && m_distanceMoved >= m_maxDistance)
	{
		// if I have a max distance, check to stop me
		Clear();

		m_onPoint = true;
	}
	else if (AtPoint(targetPoint))
	{
		m_currentPoint++;

		if (m_currentPoint >= m_pathLength)
		{
			// i'm finished!
			Clear();
		}

		m_onPoint = true;
	}
}

void CPathFind::StepTo(position_t* pos, bool run)
{

	float speed = GetRealSpeed();

	int8 mode = 2;

	if (!run)
	{
		mode = 1;
		speed /= 2;
	}

	// face point mob is moving towards
	LookAt(*pos);

	float stepDistance = ((float)speed / 10) / 2;
	float distanceTo = distance(m_PTarget->loc.p, *pos);

	// if i'm going to overshoot the checkpoint just put me there
	if (distanceTo <= stepDistance)
	{
		m_distanceMoved += distanceTo;

		m_PTarget->loc.p.x = pos->x;
		m_PTarget->loc.p.y = pos->y;
		m_PTarget->loc.p.z = pos->z;

	}
	else
	{
		m_distanceMoved += stepDistance;
		// take a step towards target point
		float radians = (1 - (float)m_PTarget->loc.p.rotation / 256) * 2 * M_PI;

		m_PTarget->loc.p.x += cosf(radians) * stepDistance;

		m_PTarget->loc.p.y = pos->y;

		m_PTarget->loc.p.z += sinf(radians) * stepDistance;

	}

	m_PTarget->loc.p.moving += ((0x36 * ((float)m_PTarget->speed / 0x28)) - (0x14 * (mode - 1)));

	if (m_PTarget->loc.p.moving > 0x2fff)
	{
		m_PTarget->loc.p.moving = 0;
	}
    m_PTarget->updatemask |= UPDATE_POS;
}

bool CPathFind::FindPath(position_t* start, position_t* end)
{

	m_pathLength = m_PTarget->loc.zone->m_navMesh->findPath(*start, *end, m_points, MAX_PATH_POINTS);

	if (m_pathLength <= 0)
	{
		ShowError("CPathFind::FindPath Entity (%d) could not find path", m_PTarget->id);
		return false;
	}

	return true;
}

bool CPathFind::FindRandomPath(position_t* start, float maxRadius)
{

	m_pathLength = m_PTarget->loc.zone->m_navMesh->findRandomPath(*start, maxRadius, m_points, MAX_PATH_POINTS);

	if (m_pathLength <= 0)
	{
		// Remarked out by Whasf, log spam!!
		//   ShowError("CPathFind::FindRandomPath Entity (%d) could not find path\n", m_PTarget->id);
		return false;
	}

	return true;
}

bool CPathFind::FindClosestPath(position_t* start, position_t* end)
{

	m_pathLength = m_PTarget->loc.zone->m_navMesh->findPath(*start, *end, m_points, MAX_PATH_POINTS);

	if (m_pathLength <= 0)
	{
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
	// don't look if i'm at that point
	if (!AtPoint(&point)){
		m_PTarget->loc.p.rotation = getangle(m_PTarget->loc.p, point);
	}
    m_PTarget->updatemask |= UPDATE_POS;
}

bool CPathFind::OnPoint()
{
	return m_onPoint;
}

float CPathFind::GetRealSpeed()
{
	uint8 baseSpeed = m_PTarget->speed;

	if (m_PTarget->objtype != TYPE_NPC)
	{
		baseSpeed = ((CBattleEntity*)m_PTarget)->GetSpeed();
	}

	if (baseSpeed == 0 && (m_roamFlags & ROAMFLAG_WORM))
	{
		baseSpeed = 20;
	}

	if (m_PTarget->animation == ANIMATION_ATTACK)
	{
		baseSpeed = baseSpeed + map_config.mob_speed_mod;
	}

	return baseSpeed;
}

bool CPathFind::IsFollowingPath()
{
	return m_pathLength > 0;
}

bool CPathFind::IsFollowingScriptedPath()
{
	return m_pathLength > 0 && m_pathFlags & PATHFLAG_SCRIPT;
}

bool CPathFind::AtPoint(position_t* pos)
{
	return m_PTarget->loc.p.x == pos->x && m_PTarget->loc.p.z == pos->z;
}

bool CPathFind::InWater()
{
	if (isNavMeshEnabled())
	{
		return m_PTarget->loc.zone->m_navMesh->inWater(m_PTarget->loc.p);
	}

	return false;
}

bool CPathFind::CanSeePoint(position_t point)
{
	if (isNavMeshEnabled())
	{
		return m_PTarget->loc.zone->m_navMesh->raycast(m_PTarget->loc.p, point);
	}

	return true;
}

void CPathFind::Clear()
{
	m_pathFlags = 0;
	m_roamFlags = 0;

	m_pathLength = 0;
	m_currentPoint = 0;
	m_maxDistance = 0;
	m_distanceMoved = 0;

	m_onPoint = true;
}

void CPathFind::AddPoints(position_t* points, uint8 totalPoints, bool reverse)
{

	m_pathLength = totalPoints;

	if (totalPoints > MAX_PATH_POINTS)
	{
		ShowWarning("CPathFind::AddPoints Given too many points (%d). Limiting to max (%d)\n", totalPoints, MAX_PATH_POINTS);
		m_pathLength = MAX_PATH_POINTS;
	}

	uint8 index;

	for (uint8 i = 0; i < totalPoints; i++)
	{
		if (reverse)
		{
			index = totalPoints - 1 - i;
		}
		else
		{
			index = i;
		}

		m_points[index].x = points[i].x;
		m_points[index].y = points[i].y;
		m_points[index].z = points[i].z;
	}

}
