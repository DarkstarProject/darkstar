-----------------------------------
-- Zone: Abyssea - Tahrongi
-- NPC: ??? (qm)
-- Spawns Hedetet (F-7)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

if (trade:hasItemQty(2921,1,2948,1) == false) then

-- Player is missing at least one required item.

-- Inform payer what items they need.

player:startEvent(1001, 2921,2948);

elseif (GetMobAction(16961923) == ACTION_NONE) then

-- mob not already spawned from this

if (trade:hasItemQty(2921,1) == true and trade:hasItemQty(2948,1) == true and trade:getItemCount() == 2) then 
-- Player has all the required items so Spawn NM. 

-- Despawn after inactive for 300 sec (pt has to reclaim within 5 min of a wipe)

SpawnMob(16961923, 300):updateEnmity(player); 

player:tradeComplete();

end

end

end;