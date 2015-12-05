-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: ???
-- Spawns: Lorelei
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(3271,1) == false) then -- Player is missing at least one required item.
        player:startEvent(1010, 3271); -- Inform payer what items they need.
    elseif (GetMobAction(17818049) == ACTION_NONE) then -- mob not already spawned from this
        if (trade:hasItemQty(3271,1) and trade:getItemCount() == 1) then -- Player has all the required items.
            SpawnMob(17818049):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;