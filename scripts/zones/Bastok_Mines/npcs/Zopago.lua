-----------------------------------
-- Area: Bastok Mines
--   NPC: Zopago
-- Type: VCS Chocobo Trainer
-- @zone 234
-- !pos 51.706 -0.126 -109.065
--
-- Auto-Script: Requires Verification
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

--    player:startEvent(514); -- event that follows egg trading
end;

function onTrigger(player,npc)

    player:startEvent(508);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;