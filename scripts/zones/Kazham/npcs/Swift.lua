-----------------------------------
-- Area: Kazham
--   NPC: Swift
-- Type: Standard NPC
-- @zone 250
-- !pos 2.017 -5 -1.880
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10018);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

