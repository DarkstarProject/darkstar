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

#ifndef _CCHAREMOTIONPACKET_H
#define _CCHAREMOTIONPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

enum EMOTES : uint8
{
    EMOTE_BOW = 1,
    EMOTE_SALUTE = 2,
    EMOTE_KNEEL = 3,
    EMOTE_LAUGH = 4,
    EMOTE_CRY = 5,
    EMOTE_NO = 6,
    EMOTE_YES = 7,
    EMOTE_WAVE = 8,
    EMOTE_GOODBYE = 9,
    EMOTE_WELCOME = 10,
    EMOTE_JOY = 11,
    EMOTE_CHEER = 12,
    EMOTE_CLAP = 13,
    EMOTE_PRAISE = 14,
    EMOTE_SMILE = 15,
    EMOTE_POKE = 16,
    EMOTE_SLAP = 17,
    EMOTE_STAGGER = 18,
    EMOTE_SIGH = 19,
    EMOTE_COMFORT = 20,
    EMOTE_SURPRISED = 21,
    EMOTE_AMAZED = 22,
    EMOTE_STARE = 23,
    EMOTE_BLUSH = 24,
    EMOTE_ANGRY = 25,
    EMOTE_DISGUSTED = 26,
    EMOTE_MUTED = 27,
    EMOTE_DOZE = 28,
    EMOTE_PANIC = 29,
    EMOTE_GRIN = 30,
    EMOTE_DANCE = 31,
    EMOTE_THINK = 32,
    EMOTE_FUME = 33,
    EMOTE_DOUBT = 34,
    EMOTE_SULK = 35,
    EMOTE_PSYCH = 36,
    EMOTE_HUH = 37,
    EMOTE_SHOCKED = 38,
    EMOTE_HURRAY = 43,
    EMOTE_TOSS = 44,
    EMOTE_DANCE1 = 65,
    EMOTE_DANCE2 = 66,
    EMOTE_DANCE3 = 67,
    EMOTE_DANCE4 = 68,
    EMOTE_JOB = 74
};

enum EMOTE_MODE : uint8
{
    EMOTEMODE_ALL = 0,
    EMOTEMODE_TEXT = 1,
    EMOTEMODE_MOTION = 2
};

class CCharEntity;

class CCharEmotionPacket : public CBasicPacket
{
public:
    CCharEmotionPacket(CCharEntity* PChar, uint32 TargetID, uint16 TargetIndex, uint8 EmoteID, uint8 EmoteMode, uint16 extra);
};

#endif