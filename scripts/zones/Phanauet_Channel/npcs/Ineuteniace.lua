-----------------------------------
-- Area: Phanauet Channel
--  NPC: Ineuteniace
-- Type: Standard NPC
-- !pos 11.701 -3 1.360 1
-----------------------------------
package.loaded["scripts/zones/Phanauet_Channel/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(101);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

