-----------------------------------
-- Zone: Abyssea Altepa
-- NPC: ??? (qm)
-- Spawns  Emperador de Altepa (H-8)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

if (trade:hasItemQty(3234,1,3244,1) == false) then

-- Player is missing at least one required item.

-- Inform payer what items they need.

player:startEvent(1001, 3234,3244);

elseif (GetMobAction(17670571) == ACTION_NONE) then

-- mob not already spawned from this

if (trade:hasItemQty(3234,1) == true and trade:hasItemQty(3244,1) == true and trade:getItemCount() == 2) then 
-- Player has all the required items so Spawn NM. 

-- Despawn after inactive for 300 sec (pt has to reclaim within 5 min of a wipe)

SpawnMob(17670571, 300):updateEnmity(player); 

player:tradeComplete();

end

end

end;