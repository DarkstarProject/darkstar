-----------------------------------
-- Zone: Abyssea-Ullegrand
--  NPC: ???
-- Spawns: Dhrome Khimaira
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(3253,1) == false or trade:hasItemQty(3247,1) == false or trade:hasItemQty(3246,1) == false) then -- Player is missing at least one required item.
        player:startEvent(1010, 3253 ,3247 ,3246); -- Inform payer what items they need.
    elseif (GetMobAction(17813927) == ACTION_NONE) then -- mob not already spawned from this
        if (trade:hasItemQty(3253,1) and trade:hasItemQty(3247,1) and trade:hasItemQty(3246,1) and trade:getItemCount() == 3) then -- Player has all the required items.
            SpawnMob(17813927):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;