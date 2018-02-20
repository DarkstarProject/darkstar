-----------------------------------
-- Area: Metalworks
--  NPC: Quasim
-- Adventurer's Assistant
-------------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/settings");
require("scripts/zones/Metalworks/TextIDs");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(742);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
