-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: ??? (qm)
-- Spawns  Fear Gorta (L-6)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2905,1) == false) then
        -- Player is missing at least one required item.
        -- Inform payer what items they need.
        player:startEvent(1010, 2905);
    elseif (GetMobAction(16839033) == ACTION_NONE) then
        -- mob not already spawned from this
        if (trade:hasItemQty(2905,1) and trade:getItemCount() == 1) then
            -- Player has all the required items so Spawn NM. 
            -- Despawn after inactive for 300 sec (pt has to reclaim within 5 min of a wipe)
            SpawnMob(16839033, 300):updateEnmity(player); 
            player:tradeComplete();
        end
    end
end;