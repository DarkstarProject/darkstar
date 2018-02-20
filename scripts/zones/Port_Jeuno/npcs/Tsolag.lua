-----------------------------------
-- Area: Port Jeuno
--  NPC: Tsolag
-- Type: NPC
-- @zone 246
-- !pos -13 8 53
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

