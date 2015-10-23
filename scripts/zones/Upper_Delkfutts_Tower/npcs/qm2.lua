-----------------------------------
-- Area: Upper Delkfutt's Tower
-- NPC:  ???
-- @pos -302.000 -159.000 21.000 158
-----------------------------------
package.loaded["scripts/zones/Upper_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Upper_Delkfutts_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    -- Trade moldy buckler
    if (GetMobAction(17424444) == 0 and trade:hasItemQty(2386,1) and trade:getItemCount() == 1) then 
        player:tradeComplete();
        SpawnMob(17424444,120):updateClaim(player); -- Pallas
        npc:setStatus(STATUS_DISAPPEAR);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;