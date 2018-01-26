-----------------------------------
-- Area: La Theine Plateau
--  NPC: Tayula
-- Type: Mission
-- !pos -311.785 50.351 182.063 102
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(105);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

