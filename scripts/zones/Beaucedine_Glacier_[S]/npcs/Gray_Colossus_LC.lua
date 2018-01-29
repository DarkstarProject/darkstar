-----------------------------------
-- Area: Beaucedine Glacier (S)
--   NPC: Gray Colossus, L.C.
-- Type: Campaign Arbiter
-- @zone 136
-- !pos 76.178 -60.763 -48.775
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(451);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

