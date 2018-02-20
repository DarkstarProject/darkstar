-----------------------------------
-- Area: Eastern Adoulin
--   NPC: Chat Manual
-- Type: Tutorial NPC
-- @zone: 257
--  !pos Unknown (needs retail capture?)
-----------------------------------
package.loaded["scripts/zones/Eastern_Adoulin/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(6106);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

