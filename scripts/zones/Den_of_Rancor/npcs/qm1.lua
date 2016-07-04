-----------------------------------
-- Area: Den of Rancor
-- NPC:  ??? - HakuTaku spawn
-- @pos 24 25 -306 160
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Den_of_Rancor/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    -- Trade Hakutaku Eye Cluster 
    if (GetMobAction(17433005) == 0 and trade:hasItemQty(1298,1) and trade:getItemCount() == 1) then 
        player:tradeComplete();
        SpawnMob(17433005,120):updateClaim(player); -- Hakutaku
        npc:setStatus(STATUS_DISAPPEAR);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;