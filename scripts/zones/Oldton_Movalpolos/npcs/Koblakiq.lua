-----------------------------------
-- Area: Oldton Movalpolos
--  NPC: Koblakiq
-- Type: NPC Quest
-- !pos -64.851 21.834 -117.521 11
-----------------------------------
package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(13);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

