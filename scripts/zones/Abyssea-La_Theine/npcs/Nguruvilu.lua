-----------------------------------
-- Zone: Abyssea-La Theine
--  NPC: ??? (qm)
-- Spawns Nguruvilu (J-11)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2899,1) == false) then
        -- Player is missing at least one required item.
        -- Inform payer what items they need.
        player:startEvent(1011, 2899);
    elseif (GetMobAction(17318442) == ACTION_NONE) then
        -- mob not already spawned from this
        if (trade:hasItemQty(2899,1) and trade:getItemCount() == 1) then
            -- Player has all the required items so Spawn NM. 
            -- Despawn after inactive for 60 sec (pt has to reclaim within 1 min of a wipe)
            SpawnMob(17318442, 60):updateEnmity(player); 
            player:tradeComplete();
        end
    end
end;