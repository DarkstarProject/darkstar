-----------------------------------
-- Area: Heavens Tower
--  NPC: Ufu Koromoa
-- Type: Standard NPC
-- !pos -2.074 -48 14.000 242
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
        player:startEvent(402);
    else
        player:startEvent(94);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 402) then
        player:setVar("HighEsteem",0);
    end
end;
