-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: ???
-- Spawns: Ningishzida
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(3268,1) == false or trade:hasItemQty(3262,1) == false or trade:hasItemQty(3261,1) == false) then -- Player is missing at least one required item.
        player:startEvent(1010, 3268 ,3262 ,3261); -- Inform payer what items they need.
    elseif (GetMobAction(17818042) == ACTION_NONE) then -- mob not already spawned from this
        if (trade:hasItemQty(3268,1) and trade:hasItemQty(3262,1) and trade:hasItemQty(3261,1) and trade:getItemCount() == 3) then -- Player has all the required items.
            SpawnMob(17818042):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;