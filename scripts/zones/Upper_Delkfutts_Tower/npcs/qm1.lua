-----------------------------------
-- Area: Upper Delkfutt's Tower
-- NPC:  ???
-- @pos -300 -175 22 158
-----------------------------------
package.loaded["scripts/zones/Upper_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Upper_Delkfutts_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    -- Trade moldy buckler
    if (GetMobAction(17424480) == 0 and trade:hasItemQty(2385,1) and trade:getItemCount() == 1) then 
        player:tradeComplete();
        SpawnMob(17424480,120):updateClaim(player); -- Alkyoneus
        npc:setStatus(STATUS_DISAPPEAR);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;