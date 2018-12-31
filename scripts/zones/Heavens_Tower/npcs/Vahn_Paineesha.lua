-----------------------------------
-- Area: Heavens Tower
--  NPC: Vahn Paineesha
-- Type: Standard NPC
-- !pos -2.502 -47.999 -15.083 242
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
        player:startEvent(404);
    else
        player:startEvent(89);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 404) then
        player:setVar("TremendousWish",0);
    end
end;
