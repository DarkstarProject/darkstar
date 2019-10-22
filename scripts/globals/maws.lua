-----------------------------------
-- Cavernous Maw global functions
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/settings")
require("scripts/globals/teleports")
require("scripts/globals/titles")
require("scripts/globals/zone")
-----------------------------------

dsp.maws = dsp.maws or {}

local ZN = dsp.zone
local MAW = dsp.teleport.type.PAST_MAW

local pastMaws = 
{ --[ZONE ID]                    = {Bit in Array, Type Maw, Cutscene 1, 2, 3, Destination Coordinates}
    [ZN.BATALLIA_DOWNS]          = {bit = 0, group = 1, cs1 = 500, cs2 = 501, cs3 = 910, dest = { -51.486,   0.371,  436.972, 128,  84}},
    [ZN.ROLANBERRY_FIELDS]       = {bit = 1, group = 1, cs1 = 500, cs2 = 501, cs3 = 904, dest = {-196.500,   7.999,  361.192, 225,  91}},
    [ZN.SAUROMUGUE_CHAMPAIGN]    = {bit = 2, group = 1, cs1 = 500, cs2 = 501, cs3 = 904, dest = { 366.858,   8.545, -228.861,  95,  98}},
    [ZN.JUGNER_FOREST]           = {bit = 3, group = 2, cs1 = 905, cs2 = nil, cs3 = nil, dest = {-116.093,  -8.005, -520.041,   0,  82}},
    [ZN.PASHHOW_MARSHLANDS]      = {bit = 4, group = 2, cs1 = 905, cs2 = nil, cs3 = nil, dest = { 415.945,  24.659,   25.611, 101,  90}},
    [ZN.MERIPHATAUD_MOUNTAINS]   = {bit = 5, group = 2, cs1 = 905, cs2 = nil, cs3 = nil, dest = { 595.000, -32.000,  279.300,  93,  97}},
    [ZN.EAST_RONFAURE]           = {bit = 6, group = 2, cs1 = 904, cs2 = nil, cs3 = nil, dest = { 322.057, -60.059,  503.712,  64,  81}},
    [ZN.NORTH_GUSTABERG]         = {bit = 7, group = 2, cs1 = 903, cs2 = nil, cs3 = nil, dest = { 469.697,  -0.050,  478.949,   0,  88}},
    [ZN.WEST_SARUTABARUTA]       = {bit = 8, group = 2, cs1 = 904, cs2 = nil, cs3 = nil, dest = {   2.628,  -0.150, -166.562,  32,  95}},
    [ZN.BATALLIA_DOWNS_S]        = {bit = 0, group = 3, cs1 = 701, cs2 = 100, cs3 = 101, dest = { -51.486,   0.371,  436.972, 128, 105}},
    [ZN.ROLANBERRY_FIELDS_S]     = {bit = 1, group = 3, cs1 = 701, cs2 = 101, cs3 = 102, dest = {-196.500,   7.999,  361.192, 225, 110}},
    [ZN.SAUROMUGUE_CHAMPAIGN_S]  = {bit = 2, group = 3, cs1 = 701, cs2 = 101, cs3 = 102, dest = { 366.858,   8.545, -228.861,  95, 120}},
    [ZN.JUGNER_FOREST_S]         = {bit = 3, group = 4, cs1 = 101, cs2 = 102, cs3 = nil, dest = {-116.093,  -8.005, -520.041,   0, 104}},
    [ZN.PASHHOW_MARSHLANDS_S]    = {bit = 4, group = 4, cs1 = 100, cs2 = 101, cs3 = nil, dest = { 415.945,  24.659,   25.611, 101, 109}},
    [ZN.MERIPHATAUD_MOUNTAINS_S] = {bit = 5, group = 4, cs1 = 102, cs2 = 103, cs3 = nil, dest = { 595.000, -32.000,  279.300,  93, 119}},
    [ZN.EAST_RONFAURE_S]         = {bit = 6, group = 4, cs1 = 100, cs2 = 101, cs3 = nil, dest = { 322.057, -60.059,  503.712,  64, 101}},
    [ZN.NORTH_GUSTABERG_S]       = {bit = 7, group = 4, cs1 = 100, cs2 = 101, cs3 = nil, dest = { 469.697,  -0.050,  478.949,   0, 106}},
    [ZN.WEST_SARUTABARUTA_S]     = {bit = 8, group = 4, cs1 = 100, cs2 = 101, cs3 = nil, dest = {   2.628,  -0.150, -166.562,  32, 115}},
}

local function meetsMission2Reqs(player)

    if not player:getCurrentMission(WOTG) == dsp.mission.id.wotg.BACK_TO_THE_BEGINNING then
        return false
    end

    local Q  = dsp.quest.id.crystalWar    
    local Q1 = player:getQuestStatus(CRYSTAL_WAR, Q.CLAWS_OF_THE_GRIFFON) == QUEST_COMPLETED
    local Q2 = player:getQuestStatus(CRYSTAL_WAR, Q.THE_TIGRESS_STRIKES)  == QUEST_COMPLETED
    local Q3 = player:getQuestStatus(CRYSTAL_WAR, Q.FIRES_OF_DISCONTENT)  == QUEST_COMPLETED

    return Q1 or Q2 or Q3

end

local function endMission2(player)

    player:completeMission(WOTG, dsp.mission.id.wotg.BACK_TO_THE_BEGINNING);
    player:addMission(WOTG, dsp.mission.id.wotg.CAIT_SITH);
    player:addTitle(dsp.title.CAIT_SITHS_ASSISTANT);

end

local function endMission1(player)

    local ID = require("scripts/zones/"..player:getZoneName().."/IDs")
    player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.PURE_WHITE_FEATHER)
    player:addKeyItem(dsp.ki.PURE_WHITE_FEATHER)
    player:completeMission(WOTG,dsp.mission.id.wotg.CAVERNOUS_MAWS)
    player:addMission(WOTG,dsp.mission.id.wotg.BACK_TO_THE_BEGINNING)

end

dsp.maws.onTrigger = function(player, npc)

    local ID = require("scripts/zones/"..player:getZoneName().."/IDs")

    if not ENABLE_WOTG == 1 then
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
        return
    end

    local hasFeather = player:hasKeyItem(dsp.ki.PURE_WHITE_FEATHER)
    local maw = pastMaws[player:getZoneID()]
    local hasMaw = player:hasTeleport(MAW, maw.bit)
    local event = 0

    if maw.group == 1 then     -- Present - Involved in Mission
        event = not hasFeather and maw.cs1 or (not hasMaw and 0 or (meetsMission2Reqs(player) and maw.cs2 or maw.cs3))
    elseif maw.group == 2 then -- Present - Not Involved in Mission
        event = hasMaw and maw.cs1 or 0
    elseif maw.group == 3 then -- Past - Involved in Mission
        event = meetsMission2Reqs(player) and maw.cs1 or (not hasMaw and maw.cs2 or maw.cs3)
    elseif maw.group == 4 then -- Past - Not Involved in Mission
        event = not hasMaw and maw.cs1 or maw.cs2
    end

    if event == 0 then
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    else
        player:startEvent(event)
    end

end

dsp.maws.onEventFinish = function(player, csid, option)

    local maw = pastMaws[player:getZoneID()]

    local addMaw = function()
        player:addTeleport(MAW, maw.bit)
    end
    local goToMaw = function()
        player:setPos(unpack(maw.dest))
    end

    if maw.group == 1 then
        if csid == maw.cs3 then
            goToMaw()
        elseif csid == maw.cs1 then
            endMission1(player)
            local x = math.random(1, 3)
            if x == 1 then
                maw = pastMaws[ZN.BATALLIA_DOWNS]
            elseif x == 2 then
                maw = pastMaws[ZN.ROLANBERRY_FIELDS]
            else
                maw = pastMaws[ZN.SAUROMUGUE_CHAMPAIGN]
            end
            addMaw()
            goToMaw()
        elseif csid == maw.cs2 then
            endMission2(player)
            goToMaw()
        end
    elseif maw.group == 2 then
        if csid == maw.cs1 and option == 1 then
            goToMaw()
        end
    elseif maw.group == 3 then
        if csid == maw.cs3 and option == 1 then
            goToMaw()
        elseif csid == maw.cs2 and option == 1 then
            addMaw()
            goToMaw()
        elseif csid == maw.cs1 then
            endMission2(player)
            if not player:hasTeleport(MAW, maw.bit) then
                addMaw()
            end
            goToMaw()
        end
    elseif maw.group == 4 then
        if option == 1 then
            if csid == maw.cs1 then
                addMaw()
            end
            goToMaw()
        end
    end

end