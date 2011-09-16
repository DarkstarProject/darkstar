// Copyright (c) 2010-2011 Darkstar Dev Teams

#ifndef _TIMER_H
#define _TIMER_H

#include "../common/cbasetypes.h"

#define DIFF_TICK(a,b) ((uint32)((a)-(b)))

uint32 gettick(void);
uint32 gettick_nocache(void);

void timer_init(void);
void timer_final(void);

#endif
