-----------------------------------
-- Area: Den of Rancor
-- NPC:  Altar of Rancor
-- @pos -76 16 -1 160
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Den_of_Rancor/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    -- Trade Unlit Lantern
    if (trade:hasItemQty(1138,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        player:addItem(1139);
        player:messageSpecial(ITEM_OBTAINED,1139); -- Rancor Flame
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(LANTERN_OFFSET + 1); -- The lanterns have been put out.
end; 