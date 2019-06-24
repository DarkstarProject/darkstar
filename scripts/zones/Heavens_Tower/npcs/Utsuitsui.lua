-----------------------------------
-- Area: Heavens Tower
--  NPC: Utsuitsui
-- Type: Standard NPC
-- !pos 6.379 -26.5 -4.043 242
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
        player:startEvent(397);
    else
        player:startEvent(66);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 397) then
        player:setVar("PainJoy",0);
    end
end;
