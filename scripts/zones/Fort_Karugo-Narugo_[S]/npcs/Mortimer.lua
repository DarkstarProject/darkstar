----------------------------------
-- Area: Fort Karugo Narugo [S]
--  NPC: Mortimer
-- Type: Item Deliverer
--  @zone 96
-- !pos -24.08    -68.508    93.88
--
-----------------------------------
package.loaded["scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs");
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

