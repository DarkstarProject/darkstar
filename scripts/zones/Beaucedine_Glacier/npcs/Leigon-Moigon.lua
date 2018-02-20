-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Leigon-Moigon
-- !pos 106.567 -21.249 140.770 111
-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(103);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

