-----------------------------------
-- Area: Phanauet Channel
--  NPC: Laiteconce
-- Type: Standard NPC
-- !pos 4.066 -4.5 -10.450 1
-----------------------------------
package.loaded["scripts/zones/Phanauet_Channel/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(1);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

