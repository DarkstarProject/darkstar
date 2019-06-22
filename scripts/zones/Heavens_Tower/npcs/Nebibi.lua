-----------------------------------
-- Area: Heavens Tower
--  NPC: Nebibi
-- Type: Standard NPC
-- !pos 23.539 -27.25 22.589 242
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local pNation = player:getNation();
    local currentMission = player:getCurrentMission(pNation);
    local MissionStatus = player:getVar("MissionStatus");

    if (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.MOON_READING and MissionStatus >= 3) or (player:hasCompletedMission(WINDURST, dsp.mission.id.windurst.MOON_READING)) then
        player:startEvent(399);
    else
        player:startEvent(68);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 399) then
        player:setVar("LovelyDay",0);
    end
end;
