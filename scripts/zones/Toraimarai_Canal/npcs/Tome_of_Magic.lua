-----------------------------------
-- Area: Toraimarai Canal
-- NPC:  Tome of Magic ( Needed for Mission )
-- Involved In Windurst Mission 7-1
-- @zone 169
-- !pos 142 13 -13 169 <many>
-----------------------------------
require("scripts/zones/Toraimarai_Canal/MobIDs");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local offset = npc:getID() - TOME_OF_MAGIC_OFFSET;
    
    if (offset == 4 and player:getCurrentMission(WINDURST) == THE_SIXTH_MINISTRY and player:getVar("MissionStatus") == 1) then
        player:startEvent(69);
    elseif (offset >= 0 and offset <= 3) then
        player:startEvent(65 + offset);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 69) then
        player:setVar("MissionStatus",2);
    end
end;
