-----------------------------------
-- Area: Heavens Tower
--  NPC: Aeshushu
-- Type: Standard NPC
-- !pos 4.948 -26.5 -2.303 242
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
        player:startEvent(391);
    else
        player:startEvent(60);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 391) then
        player:setVar("StressedOut",0);
    end
end;
