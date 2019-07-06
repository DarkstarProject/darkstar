-----------------------------------
-- Area: Selbina (248)
--  NPC: Naillina
-- Standard Info NPC
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getCurrentMission(ROV) == dsp.mission.id.rov.EMISSARY_FROM_THE_SEAS and player:getVar("ROV") == 1 then
        player:startEvent(177)
    else
        player:startEvent(14)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 177 then
        player:completeMission(ROV,dsp.mission.id.rov.EMISSARY_FROM_THE_SEAS)
        player:addMission(ROV,dsp.mission.id.rov.SET_FREE)
    end
end
