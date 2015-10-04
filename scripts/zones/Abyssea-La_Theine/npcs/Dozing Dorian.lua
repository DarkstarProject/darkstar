-----------------------------------
-- Zone: Abyssea-La Theine
--  NPC: ??? (qm)
-- Spawns  Dozing Dorian (L-6)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2891,1) == false) then
        -- Player is missing at least one required item.
        -- Inform payer what items they need.
        player:startEvent(1006, 2891);
    elseif (GetMobAction(17318434) == ACTION_NONE) then
        -- mob not already spawned from this
        if (trade:hasItemQty(2891,1) and trade:getItemCount() == 1) then
            -- Player has all the required items so Spawn NM. 
            -- Despawn after inactive for 60 sec (pt has to reclaim within 1 min of a wipe)
            SpawnMob(17318434, 60):updateEnmity(player); 
            player:tradeComplete();
        end
    end
end;
