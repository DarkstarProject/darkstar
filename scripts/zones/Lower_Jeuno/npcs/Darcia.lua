-----------------------------------
-- Area: Lower Jeuno (245)
--  NPC: Darcia
-- SoA Mission NPC
-- pos  25 -38.617 -1.000
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local rumorsFromTheWest = player:getCurrentMission(SOA) == dsp.mission.id.soa.RUMORS_FROM_THE_WEST
    local theGeomagnetron = player:getCurrentMission(SOA) == dsp.mission.id.soa.THE_GEOMAGNETRON

    if not ENABLE_SOA then
        player:startEvent(10124)
    elseif rumorsFromTheWest then
        player:startEvent(10117, 0, 40, 26, 0)
    elseif theGeomagnetron and player:getVar("SOA") == 1 then
        player:startEvent(10118)
    elseif theGeomagnetron then
        player:startEvent(10117, 1, 40, 26, 0)
    else
        player:startEvent(10123)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 10117 and option == 1 then -- accepted geomagnetron
        npcUtil.giveKeyItem(player, dsp.ki.GEOMAGNETRON)

        player:completeMission(SOA,dsp.mission.id.soa.RUMORS_FROM_THE_WEST)
        player:addMission(SOA,dsp.mission.id.soa.THE_GEOMAGNETRON)
    elseif
        (csid == 10117 and option == 2) or -- paid
        csid == 10118  -- quest complete
    then
        if option == 2 then player:delGil(1000000) end

        player:delKeyItem(dsp.ki.GEOMAGNETRON)
        npcUtil.giveKeyItem(player, dsp.ki.GEOMAGNETRON)
        npcUtil.giveKeyItem(player, dsp.ki.ADOULINIAN_CHARTER_PERMIT)

        player:completeMission(SOA,dsp.mission.id.soa.THE_GEOMAGNETRON)
        player:addMission(SOA,dsp.mission.id.soa.ONWARD_TO_ADOULIN)

        player:setVar("SOA", 0)
    end
end
