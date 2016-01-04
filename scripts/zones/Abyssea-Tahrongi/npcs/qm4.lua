-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: ???
-- Spawns: Cannered Noz
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(2918,1) == false) then -- Player is missing at least one required item.
        player:startEvent(1010, 2918); -- Inform payer what items they need.
    elseif (GetMobAction(16961920) == ACTION_NONE) then -- mob not already spawned from this
        if (trade:hasItemQty(2918,1) and trade:getItemCount() == 1) then -- Player has all the required items.
            SpawnMob(16961920):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;