-----------------------------------
-- Zone: Abyssea-La Theine
--  NPC: ??? (qm)
-- Spawns  Toppling Tuber (F-7)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2901,1) == false) then
        -- Player is missing at least one required item.
        -- Inform payer what items they need.
        player:startEvent(1009, 2901);
    elseif (GetMobAction(17318444) == ACTION_NONE) then
        -- mob not already spawned from this
        if (trade:hasItemQty(2901,1) and trade:getItemCount() == 1) then
            -- Player has all the required items so Spawn NM. 
            -- Despawn after inactive for 60 sec (pt has to reclaim within 1 min of a wipe)
            SpawnMob(17318444, 60):updateEnmity(player); 
            player:tradeComplete();
        end
    end
end;
