-----------------------------------
-- Area: Lower Jeuno
--  NPC: Taza
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Lower_Jeuno/TextIDs")

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, TAZA_SHOP_DIALOG)
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
