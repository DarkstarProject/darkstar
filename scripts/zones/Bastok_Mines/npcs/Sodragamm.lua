-----------------------------------
-- Area: Bastok Mines
--   NPC: Sodragamm
-- Type: Item Deliverer
-- @zone 234
-- !pos -24.741 -1 -64.944
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, ITEM_DELIVERY_DIALOG);
    player:openSendBox();
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

