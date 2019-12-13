-----------------------------------
--
-- Zone: Northern_San_dOria (231)
--
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/titles")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    SetExplorerMoogles(ID.npc.EXPLORER_MOOGLE)

    zone:registerRegion(1, -7,-3,110, 7,-1,155)

    applyHalloweenNpcCostumes(zone:getID())
end

function onZoneIn(player,prevZone)

    local currentMission = player:getCurrentMission(SANDORIA)
    local MissionStatus = player:getCharVar("MissionStatus")
    local cs = -1

    -- SOA 1-1 Optional CS
    if 
        ENABLE_SOA and 
        player:getCurrentMission(SOA) == dsp.mission.id.soa.RUMORS_FROM_THE_WEST and 
        player:getCharVar("SOA_1_CS1") == 0 
    then
        cs = 878
    end

    -- FIRST LOGIN (START CS)
    if (player:getPlaytime(false) == 0) then
        if (OPENING_CUTSCENE_ENABLE == 1) then
            cs = 535
        end
        player:setPos(0,0,-11,191)
        player:setHomePoint()
    end
    -- MOG HOUSE EXIT
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(130,-0.2,-3,160)
        if (player:getMainJob() ~= player:getCharVar("PlayerMainJob")) then
            cs = 30004
        end
        player:setCharVar("PlayerMainJob",0)
    end
    -- RDM AF3 CS
    if (player:getCharVar("peaceForTheSpiritCS") == 5 and player:getFreeSlotsCount() >= 1) then
        cs = 49
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_ROAD_FORKS and player:getCharVar("EMERALD_WATERS_Status") == 1) then --EMERALD_WATERS-- COP 3-3A: San d'Oria Route
        player:setCharVar("EMERALD_WATERS_Status",2)
        cs = 14
    elseif (currentMission == dsp.mission.id.sandoria.THE_HEIR_TO_THE_LIGHT and MissionStatus == 0) then
        cs = 1
    elseif (currentMission == dsp.mission.id.sandoria.THE_HEIR_TO_THE_LIGHT and MissionStatus == 4) then
        cs = 0
    elseif (player:hasCompletedMission(SANDORIA,dsp.mission.id.sandoria.COMING_OF_AGE) and tonumber(os.date("%j")) == player:getCharVar("Wait1DayM8-1_date")) then
        cs = 16
    end
    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player,region)
    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)  -- Chateau d'Oraguille access
        pNation = player:getNation()
        currentMission = player:getCurrentMission(pNation)
            if ((pNation == 0 and player:getRank() >= 2) or (pNation > 0 and player:hasCompletedMission(pNation,5) == 1) or (currentMission >= 5 and currentMission <= 9) or (player:getRank() >= 3)) then
                player:startEvent(569)
            else
                player:startEvent(568)
            end
        end,
    }
end

function onRegionLeave(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if (csid == 535) then
        player:messageSpecial(ID.text.ITEM_OBTAINED,536) -- adventurer coupon
    elseif (csid == 1) then
        player:setCharVar("MissionStatus",1)
    elseif (csid == 0) then
        player:setCharVar("MissionStatus",5)
    elseif (csid == 30004 and option == 0) then
        player:setHomePoint()
        player:messageSpecial(ID.text.HOMEPOINT_SET)
    elseif (csid == 569) then
        player:setPos(0,0,-13,192,233)
    elseif (csid == 49 and npcUtil.completeQuest(player, SANDORIA, dsp.quest.id.sandoria.PEACE_FOR_THE_SPIRIT, {item = 12513, fame = 60, title = dsp.title.PARAGON_OF_RED_MAGE_EXCELLENCE})) then
        player:setCharVar("peaceForTheSpiritCS",0)
    elseif (csid == 16) then
        player:setCharVar("Wait1DayM8-1_date",0)
        player:setCharVar("Mission8-1Completed",1)
    elseif csid == 878 then
        player:setCharVar("SOA_1_CS1", 1)
    end
end
