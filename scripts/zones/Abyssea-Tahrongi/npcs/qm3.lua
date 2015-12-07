-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: ???
-- Spawns: Ophanim
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(2917,1) == false or trade:hasItemQty(2945,1) == false or trade:hasItemQty(2946,1) == false) then -- Player is missing at least one required item.
        player:startEvent(1010, 2917 ,2945 ,2946); -- Inform payer what items they need.
    elseif (GetMobAction(16961919) == ACTION_NONE) then -- mob not already spawned from this
        if (trade:hasItemQty(2917,1) and trade:hasItemQty(2945,1) and trade:hasItemQty(2946,1) and trade:getItemCount() == 3) then -- Player has all the required items.
            SpawnMob(16961919):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;