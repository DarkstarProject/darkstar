-----------------------------------
-- Area: Heavens Tower
--  NPC: Boycoco
-- Type: Standard NPC
-- !pos -6.360 -26.5 -4.167 242
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
        player:startEvent(388);
    else
        player:startEvent(57);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 388) then
        player:setVar("SimplePrayer",0);
    end
end;
