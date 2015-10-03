-----------------------------------
-- Zone: Abyssea - Tahrongi
--  NPC: ??? (qm)
-- Spawns Abas (K-10)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2922,1) == false) then
        -- Player is missing at least one required item.
        -- Inform payer what items they need.
        player:startEvent(1001, 2922);
    elseif (GetMobAction(16961924) == ACTION_NONE) then
        -- mob not already spawned from this
        if (trade:hasItemQty(2922,1) and trade:getItemCount() == 1) then
            -- Player has all the required items so Spawn NM. 
            -- Despawn after inactive for 300 sec (pt has to reclaim within 5 min of a wipe)
            SpawnMob(16961924, 300):updateEnmity(player); 
            player:tradeComplete();
        end
    end
end;