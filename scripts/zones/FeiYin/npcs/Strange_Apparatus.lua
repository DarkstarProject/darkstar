-----------------------------------
-- Area: FeiYin
--  NPC: Strange Apparatus
-- !pos -94 -15 220 204
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/FeiYin/TextIDs");
require("scripts/globals/strangeapparatus");
-----------------------------------

function onTrade(player,npc,trade)
    player:startEvent(27, 0, 0, INFINITY_CORE, 0, 0, 0, 0, player:getZoneID());
end;

function onTrigger(player,npc)
    player:startEvent(25, 0, 0, INFINITY_CORE, 0, 0, 0, 0, player:getZoneID());
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;