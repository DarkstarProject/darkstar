-----------------------------------
-- Area: Bostaunieux Oubliette
--  NPC: Couchatorage
-- Type: Standard NPC
-- !pos -20.502 -19 17.765 167
-----------------------------------
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(9);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

