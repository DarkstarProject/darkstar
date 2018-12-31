-----------------------------------
-- Area: Heavens Tower
--  NPC: Dattata
-- Type: Standard NPC
-- !pos -6.172 -26.5 5.310 242
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
        player:startEvent(392);
    else
        player:startEvent(61);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 392) then
        player:setVar("NoFear",0);
    end
end;
