-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: ???
-- Spawns: Amarok
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(3238,1) == false or trade:hasItemQty(3231,1) == false or trade:hasItemQty(3232,1) == false) then -- Player is missing at least one required item.
        player:startEvent(1010, 3238 ,3231 ,3232); -- Inform payer what items they need.
    elseif (GetMobAction(17670567) == ACTION_NONE) then -- mob not already spawned from this
        if (trade:hasItemQty(3238,1) and trade:hasItemQty(3231,1) and trade:hasItemQty(3232,1) and trade:getItemCount() == 3) then -- Player has all the required items.
            SpawnMob(17670567):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;