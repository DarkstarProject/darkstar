-----------------------------------
-- Area: Selbina (248)
--  NPC: Pacomart
-- Type: ROV NPC
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getCurrentMission(ROV) == dsp.mission.id.rov.THE_BEGINNING and player:getVar("ROV") == 1 then
        player:startEvent(179)
    else
        player:startEvent(180)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 179 then
        player:completeMission(ROV,dsp.mission.id.rov.THE_BEGINNING)
        player:addMission(ROV,dsp.mission.id.rov.FLAMES_OF_PRAYER)
    end
end
