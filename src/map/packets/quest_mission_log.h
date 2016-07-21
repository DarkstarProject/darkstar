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

#ifndef _CQUESTMISSIONLOGPACKET_H
#define _CQUESTMISSIONLOGPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

// Area/Content Identifiers
#define LOG_SANDORIA             0
#define LOG_BASTOK               1
#define LOG_WINDURST             2
#define LOG_JEUNO                3
#define LOG_SELBINA              4
#define LOG_MHAURA               5
#define LOG_RABAO                6
#define LOG_KAZHAM               7
#define LOG_NORG                 8
#define LOG_OTHER_AREAS          9
#define LOG_TAVNAZIA             9
#define LOG_OUTLANDS            10
#define LOG_ZILART              11
#define LOG_COP                 12
#define LOG_AHT_URHGAN          13
#define LOG_TOAU                13
#define LOG_ASSAULT             14
#define LOG_CRYSTAL_WAR         15
#define LOG_WOTG                15
#define LOG_CAMPAIGN            16
#define LOG_CAMPAIGN2           17
#define LOG_ACP                 18
#define LOG_AMK                 19
#define LOG_ASA                 20
#define LOG_ABYSSEA             21
#define LOG_ABYSSEA_KONSCHTAT   22
#define LOG_ABYSSEA_TAHRONGI    23
#define LOG_ABYSSEA_LATHEINE    24
#define LOG_ABYSSEA_MISAREAUX   25
#define LOG_ABYSSEA_VUNKERL     26
#define LOG_ABYSSEA_ATTOHWA     27
#define LOG_ABYSSEA_ALTEPA      28
#define LOG_ABYSSEA_GRAUBERG    29
#define LOG_ABYSSEA_ULEGUERAND  30
#define LOG_ADOULIN             31
#define LOG_SOA                 31
#define LOG_COALITION           32
#define LOG_ROV                 33

// Log Types
#define QUEST_LOG           0x00
#define MISSION_LOG         0x03
#define FAME                0x06

//Quest Log Packet Values
#define SAN_CURRENT			0x50
#define BAS_CURRENT			0x58
#define WIN_CURRENT			0x60
#define JEU_CURRENT			0x68
#define OTH_CURRENT			0x70
#define OUT_CURRENT			0x78
#define EXP_CURRENT			0x80
#define WAR_CURRENT			0x88
#define ABY_CURRENT			0xE0
#define ADO_CURRENT			0xF0
#define COA_CURRENT			0x0100

#define SAN_COMPLETE		0x90
#define BAS_COMPLETE		0x98
#define WIN_COMPLETE		0xA0
#define JEU_COMPLETE		0xA8
#define OTH_COMPLETE		0xB0
#define OUT_COMPLETE		0xB8
#define EXP_COMPLETE		0xC0
#define WAR_COMPLETE		0xC8
#define ABY_COMPLETE		0xE8
#define ADO_COMPLETE		0xF8
#define COA_COMPLETE		0x0108

#define MISS_COMPLETE		0xD0
#define MISS_CURRENT		0xFFFF

#define EXP_MISS_COMPLETE   0xD8
#define EXP_MISS_CURRENT    0x80

#define CMPGN_MISS_UN       0x30
#define CMPGN_MISS_DEUX     0x38

// Status Types
#define STATUS_QUEST_CURR   0x01
#define STATUS_QUEST_COMP   0x02
#define STATUS_MISS_CURR    0x03
#define STATUS_MISS_COMP    0x04

// Log Types
const int LOG_TYPES[34][7] =
{
    // QL | Quest Cur. | Quest Comp.  | ML | Miss. Curr.     | Miss. Comp     | Fame
    {  0,  SAN_CURRENT, SAN_COMPLETE,   0,  MISS_CURRENT,     MISS_COMPLETE,      0 }, // SANDORIA
    {  1,  BAS_CURRENT, BAS_COMPLETE,   1,  MISS_CURRENT,     MISS_COMPLETE,      1 }, // BASTOK
    {  2,  WIN_CURRENT, WIN_COMPLETE,   2,  MISS_CURRENT,     MISS_COMPLETE,      2 }, // WINDURST
    {  3,  JEU_CURRENT, JEU_COMPLETE,  -1,  -1,               -1,                 3 }, // JEUNO
    {  4,  OTH_CURRENT, OTH_COMPLETE,  -1,  -1,               -1,                 4 }, // SELBINA
    {  4,  OTH_CURRENT, OTH_COMPLETE,  -1,  -1,               -1,                 2 }, // MHAURA
    {  5,  OUT_CURRENT, OUT_COMPLETE,  -1,  -1,               -1,                 4 }, // RABAO
    {  5,  OUT_CURRENT, OUT_COMPLETE,  -1,  -1,               -1,                 2 }, // KAZHAM
    {  5,  OUT_CURRENT, OUT_COMPLETE,  -1,  -1,               -1,                 5 }, // NORG
    {  4,  OTH_CURRENT, OTH_COMPLETE,  -1,  -1,               -1,                -1 }, // OTHER_AREAS = TAVNAZIA
    {  5,  OUT_CURRENT, OUT_COMPLETE,  -1,  -1,               -1,                -1 }, // OUTLANDS
    {  5,  OUT_CURRENT, OUT_COMPLETE,   3,  MISS_CURRENT,     MISS_COMPLETE,     -1 }, // ZILART
    {  4,  OTH_CURRENT, OTH_COMPLETE,   6,  MISS_CURRENT,     -1,                -1 }, // COP
    {  6,  EXP_CURRENT, EXP_COMPLETE,   4,  EXP_MISS_CURRENT, EXP_MISS_COMPLETE, -1 }, // AHTURHGAN = TOAU
    { -1,  -1,          -1,             7,  EXP_MISS_CURRENT, EXP_COMPLETE,      -1 }, // ASSAULT
    {  7,  WAR_CURRENT, WAR_COMPLETE,   5,  EXP_MISS_CURRENT, EXP_MISS_COMPLETE, -1 }, // CRYSTALWAR = WOTG
    { -1,  -1,          -1,             8,  EXP_MISS_CURRENT, CMPGN_MISS_UN,     -1 }, // CAMPAIGN
    { -1,  -1,          -1,             8,  EXP_MISS_CURRENT, CMPGN_MISS_DEUX,   -1 }, // CAMPAIGN2
    { -1,  -1,          -1,             9,  MISS_CURRENT,     -1,                -1 }, // ACP
    { -1,  -1,          -1,            10,  MISS_CURRENT,     -1,                -1 }, // AMK
    { -1,  -1,          -1,            11,  MISS_CURRENT,     -1,                -1 }, // ASA
    {  8,  ABY_CURRENT, ABY_COMPLETE,  -1,  -1,               -1,                -1 }, // ABYSSEA
    {  8,  ABY_CURRENT, ABY_COMPLETE,  -1,  -1,               -1,                 6 }, // ABYSSEA_KONSCHTAT
    {  8,  ABY_CURRENT, ABY_COMPLETE,  -1,  -1,               -1,                 7 }, // ABYSSEA_TAHRONGI
    {  8,  ABY_CURRENT, ABY_COMPLETE,  -1,  -1,               -1,                 8 }, // ABYSSEA_LATHEINE
    {  8,  ABY_CURRENT, ABY_COMPLETE,  -1,  -1,               -1,                 9 }, // ABYSSEA_MISAREAUX
    {  8,  ABY_CURRENT, ABY_COMPLETE,  -1,  -1,               -1,                10 }, // ABYSSEA_VUNKERL
    {  8,  ABY_CURRENT, ABY_COMPLETE,  -1,  -1,               -1,                11 }, // ABYSSEA_ATTOHWA
    {  8,  ABY_CURRENT, ABY_COMPLETE,  -1,  -1,               -1,                12 }, // ABYSSEA_ALTEPA
    {  8,  ABY_CURRENT, ABY_COMPLETE,  -1,  -1,               -1,                13 }, // ABYSSEA_GRAUBERG
    {  8,  ABY_CURRENT, ABY_COMPLETE,  -1,  -1,               -1,                14 }, // ABYSSEA_ULEGUERAND
    {  9,  ADO_CURRENT, ADO_COMPLETE,  12,  MISS_CURRENT,     -1,                15 }, // ADOULIN = SOA
    { 10,  COA_CURRENT, COA_COMPLETE,  -1,  -1,               -1,                -1 }, // COALITION
    { -1,  -1,          -1,            13,  MISS_CURRENT,     -1,                -1 }  // ROV
};

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CCharEntity;

class CQuestMissionLogPacket : public CBasicPacket
{
public:

    CQuestMissionLogPacket(CCharEntity* PChar, uint8 logID, uint8 status);
private:

    // формирование пакетов вынес в отдельные функции, специально для тех,
    // кто захочет понять, что же на самом деле происходит в switch(logID)

    void generateQuestPacket(CCharEntity* PChar, uint8 subjectID, uint8 status);
    void generateCurrentMissionPacket(CCharEntity* PChar);
    void generateCompleteMissionPacket(CCharEntity* PChar);
    void generateCurrentExpMissionPacket(CCharEntity* PChar);
    void generateCompleteExpMissionPacket(CCharEntity* PChar);
    void generateCampaignMissionPacket(CCharEntity* PChar, uint8 startQMID);
    void generateAssaultMissionPacket(CCharEntity* PChar);
};

#endif
