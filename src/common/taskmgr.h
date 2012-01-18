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

#ifndef _TASK_MGR_H
#define _TASK_MGR_H

#include "../common/cbasetypes.h"

#include <string>
#include <queue>
#include <functional>

template<class _Ty>
	struct greater_equal: public std::binary_function<_Ty, _Ty, bool>
{	// functor for operator>
	bool operator()(const _Ty& _Left, const _Ty& _Right) const
	{	// apply operator> to operands
		if ((*_Left) > (*_Right))
			return true;
		else if( (*_Left) < (*_Right) )
			return false;
	}
};

class CTaskMgr
{
public:

	class CTask;
	enum TASKTYPE
	{
		TASK_INTERVAL,
		TASK_ONCE,
		TASK_REMOVE,
		TASK_INVALID
	};
	typedef int32 (*TaskFunc_t)(uint32 tick,CTask*);
	typedef std::priority_queue<CTask*,std::deque<CTask*>,greater_equal<CTask*> > TaskList_t;
		
	TaskList_t& getTaskList(){ return m_TaskList; };

	CTask* AddTask(CTask*);
	CTask* AddTask(
		std::string InitName,
		size_t InitTick,
		void *InitData,
		TASKTYPE InitType,
		TaskFunc_t InitFunc,
		size_t InitInterval=1000);

	uint32	DoTimer(uint32 tick);
	void	RemoveTask(std::string TaskName);

	static CTaskMgr * getInstance();

	~CTaskMgr() {};

private:

	static CTaskMgr* _instance;
		
	TaskList_t m_TaskList;

	CTaskMgr() {};
};

class CTaskMgr::CTask
{
public:

	CTask(std::string InitName,
		size_t InitTick,
		void * InitData,
		TASKTYPE InitType,
		TaskFunc_t InitFunc,
		size_t InitInterval=1000
		):	m_name(InitName),
			m_tick(InitTick),
			m_data(InitData),
			m_type(InitType),
			m_func(InitFunc),
			m_interval(InitInterval) {};

	std::string m_name;
	TASKTYPE	m_type;
	size_t 		m_tick;
	size_t		m_interval;
	void*		m_data;
	TaskFunc_t	m_func;
};

inline bool operator<(const CTaskMgr::CTask& a,const CTaskMgr::CTask& b)
{
	return a.m_tick < b.m_tick;
};

inline bool operator>(const CTaskMgr::CTask& a,const CTaskMgr::CTask& b)
{
	return a.m_tick > b.m_tick;
};

inline bool operator >=(const CTaskMgr::CTask& a,const CTaskMgr::CTask& b)
{
	return a.m_tick >= b.m_tick;
};

inline bool operator <=(const CTaskMgr::CTask& a,const CTaskMgr::CTask &b)
{
	return a.m_tick <= b.m_tick;
}

#endif
