-----------------------------------
-- Zone: Abyssea-Ullegrand
--  NPC: ???
-- Spawns: Ironclad Triturator
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(3245,1) == false or trade:hasItemQty(3251,1) == false) then -- Player is missing at least one required item.
        player:startEvent(1010, 3245 ,3251); -- Inform payer what items they need.
    elseif (GetMobAction(17813925) == ACTION_NONE) then -- mob not already spawned from this
        if (trade:hasItemQty(3245,1) and trade:hasItemQty(3251,1) and trade:getItemCount() == 2) then -- Player has all the required items.
            SpawnMob(17813925):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;