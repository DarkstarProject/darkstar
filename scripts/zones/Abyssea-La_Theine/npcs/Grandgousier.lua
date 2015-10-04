-----------------------------------
-- Zone: Abyssea-La Theine
--  NPC: ??? (qm)
-- Spawns Grandgousier (F-10)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2896,1) == false) then
        -- Player is missing at least one required item.
        -- Inform payer what items they need.
        player:startEvent(1003, 2896);
    elseif (GetMobAction(17318439) == ACTION_NONE) then
        -- mob not already spawned from this
        if (trade:hasItemQty(2896,1) and trade:getItemCount() == 1) then
            -- Player has all the required items so Spawn NM. 
            -- Despawn after inactive for 60 sec (pt has to reclaim within 1 min of a wipe)
            SpawnMob(17318439, 60):updateEnmity(player); 
            player:tradeComplete();
        end
    end
end;
