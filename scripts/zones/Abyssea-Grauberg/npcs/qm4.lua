-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: ???
-- Spawns: Bomblix Flamefinger
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(3274,1) == false or trade:hasItemQty(3264,1) == false) then -- Player is missing at least one required item.
        player:startEvent(1010, 3274 ,3264); -- Inform payer what items they need.
    elseif (GetMobAction(17818044) == ACTION_NONE) then -- mob not already spawned from this
        if (trade:hasItemQty(3274,1) and trade:hasItemQty(3264,1) and trade:getItemCount() == 2) then -- Player has all the required items.
            SpawnMob(17818044):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;