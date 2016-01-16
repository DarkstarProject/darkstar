-----------------------------------
-- Area: Lufaise Meadows
-- NPC:  ??? - Amaltheia spawn
-- @pos 347.897 -10.895 264.382 24
-----------------------------------
package.loaded["scripts/zones/Lufaise_Meadows/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Lufaise_Meadows/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    -- Trade Relic Shield
    if (GetMobAction(16875779) == 0 and trade:hasItemQty(15066,1) and trade:getItemCount() == 1) then 
        player:tradeComplete();
        SpawnMob(16875779,120):updateClaim(player); -- Amaltheia
        npc:setStatus(STATUS_DISAPPEAR);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;