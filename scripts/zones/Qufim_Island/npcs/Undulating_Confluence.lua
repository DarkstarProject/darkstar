-----------------------------------
-- Area: Qufim Island (126)
--  NPC: Undulating Confluence
-- !pos -204.531 -20.027 75.318
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(ROV) == dsp.mission.id.rov.AT_THE_HEAVENS_DOOR then
        player:startEvent(63)
    elseif player:getCurrentMission(ROV) == dsp.mission.id.rov.THE_LIONS_ROAR then
        player:startEvent(64)
    elseif player:getCurrentMission(ROV) == dsp.mission.id.rov.EDDIES_OF_DESPAIR_I then
        player:startEvent(65)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 63 then
        player:completeMission(ROV,dsp.mission.id.rov.AT_THE_HEAVENS_DOOR)
        player:addMission(ROV,dsp.mission.id.rov.THE_LIONS_ROAR)
    elseif csid == 64 then
        -- TODO: Pop Ophiotaurus
        -- Mission is updated on it's death
        player:completeMission(ROV,dsp.mission.id.rov.THE_LIONS_ROAR)
        player:addMission(ROV,dsp.mission.id.rov.EDDIES_OF_DESPAIR_I)
    elseif csid == 65 and option == 1 then
        player:setPos(0, 0, 0, 0, 288)
    end
end
