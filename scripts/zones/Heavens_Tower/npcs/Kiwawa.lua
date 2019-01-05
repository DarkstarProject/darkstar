-----------------------------------
-- Area: Heavens Tower
--  NPC: Kiwawa
-- Type: Standard NPC
-- !pos 13.369 -27.25 18.718 242
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
        player:startEvent(389);
    else
        player:startEvent(58);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 389) then
        player:setVar("GloriousSpectacle",0);
    end
end;
