-----------------------------------
-- Area: Phanauet Channel
--  NPC: Riche
-- Type: Standard NPC
-- !pos 5.945 -3.75 13.612 1
-----------------------------------
package.loaded["scripts/zones/Phanauet_Channel/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(5);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

