-----------------------------------
-- Area: Heavens Tower
--  NPC: Ikucheechee
-- Type: Standard NPC
-- !pos -2.661 -26.5 -5.747 242
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
        player:startEvent(394);
    else
        player:startEvent(63);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 394) then
        player:setVar("SporadicScuffles",0);
    end
end;
