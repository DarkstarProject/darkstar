-----------------------------------
-- Area: Uleguerand Range
--  NPC: Chamnaet Spring
--  Receive Chamnaet Ice upon trading Cotton Pouch
-- !pos -305.240 3.605 17.977
-----------------------------------
package.loaded["scripts/zones/Uleguerand_Range/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Uleguerand_Range/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Cotton Pouch
    if (trade:hasItemQty(1779,1) and trade:getItemCount() == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1780); -- Chamnaet Ice
        else
            player:tradeComplete();
            player:addItem(1780);
            player:messageSpecial(ITEM_OBTAINED, 1780); -- Chamnaet Ice
        end
    end
end;

function onTrigger(player,npc)
end;
