-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: ??? (qm)
-- Spawns Clingy Clare (I-8)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2907,1) == false) then
        -- Player is missing at least one required item.
        -- Inform payer what items they need.
        player:startEvent(1010, 2907);
    elseif (GetMobAction(16838946) == ACTION_NONE) then
        -- mob not already spawned from this
        if (trade:hasItemQty(2907,1) and trade:getItemCount() == 1) then
            -- Player has all the required items so Spawn NM. 
            -- Despawn after inactive for 300 sec (pt has to reclaim within 5 min of a wipe)
            SpawnMob(16838946, 300):updateEnmity(player); 
            player:tradeComplete();
        end
    end
end;