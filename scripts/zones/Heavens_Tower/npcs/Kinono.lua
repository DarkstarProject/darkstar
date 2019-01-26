-----------------------------------
-- Area: Heavens Tower
--  NPC: Kinono
-- Type: Standard NPC
-- !pos 9.316 -26.999 -11.200 242
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local pNation = player:getNation();
    local currentMission = player:getCurrentMission(pNation);
    local MissionStatus = player:getVar("MissionStatus");
    
    if (player:getCurrentMission(WINDURST) == MOON_READING and MissionStatus >= 3) or (player:hasCompletedMission(WINDURST, MOON_READING)) then
        player:startEvent(398);
    else
        player:startEvent(67);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 398) then
        player:setVar("SenseEnergy",0);
    end
end;
