-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: ???
-- Spawns: Shaula
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(3233,1) == false or trade:hasItemQty(3242,1) == false) then -- Player is missing at least one required item.
        player:startEvent(1010, 3233 ,3242); -- Inform payer what items they need.
    elseif (GetMobAction(17670570) == ACTION_NONE) then -- mob not already spawned from this
        if (trade:hasItemQty(3233,1) and trade:hasItemQty(3242,1) and trade:getItemCount() == 2) then -- Player has all the required items.
            SpawnMob(17670570):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;