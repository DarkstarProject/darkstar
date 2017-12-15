-----------------------------------
-- Area: Port Bastok
--   NPC: Brita
-- Type: Standard NPC
-- @zone 236
-- !pos 58.161 -3.101 -6.695
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(346, 0, 1);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

