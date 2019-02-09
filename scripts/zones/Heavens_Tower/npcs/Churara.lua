-----------------------------------
-- Area: Heavens Tower
--  NPC: Churara
-- Type: Standard NPC
-- !pos 4.119 -26.5 -6.264 242
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
        player:startEvent(390);
    else
        player:startEvent(59);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 390) then
        player:setVar("SatisfactoryNote",0);
    end
end;
