-----------------------------------
-- Zone: Abyssea - Tahrongi
-- NPC: ??? (qm)
-- Spawns Muscaliet (J-6)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

if (trade:hasItemQty(2950,1,2925,1) == false) then

-- Player is missing at least one required item.

-- Inform payer what items they need.

player:startEvent(1001, 2950,2925);

elseif (GetMobAction(16961927) == ACTION_NONE) then

-- mob not already spawned from this

if (trade:hasItemQty(2950,1) == true and trade:hasItemQty(2925,1) == true and trade:getItemCount() == 2) then 
-- Player has all the required items so Spawn NM. 

-- Despawn after inactive for 300 sec (pt has to reclaim within 5 min of a wipe)

SpawnMob(16961927, 300):updateEnmity(player); 

player:tradeComplete();

end

end

end;