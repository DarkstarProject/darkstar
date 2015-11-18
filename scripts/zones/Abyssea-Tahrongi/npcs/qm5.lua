-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: ???
-- Spawns: Treble Noctules
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(2919,1) == false or trade:hasItemQty(2947,1) == false) then -- Player is missing at least one required item.
        player:startEvent(1010, 2919 ,2947); -- Inform payer what items they need.
    elseif (GetMobAction(16961921) == ACTION_NONE) then -- mob not already spawned from this
        if (trade:hasItemQty(2919,1) and trade:hasItemQty(2947,1) and trade:getItemCount() == 2) then -- Player has all the required items.
            SpawnMob(16961921):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;