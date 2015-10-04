-----------------------------------
-- Zone: Abyssea - Tahrongi
-- NPC: ??? (qm)
-- Spawns Ophanim (G-9)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

if (trade:hasItemQty(2917,1,2945,1,2946,1) == false) then

-- Player is missing at least one required item.

-- Inform payer what items they need.

player:startEvent(1001, 2917,2945,2946);

elseif (GetMobAction(16961919) == ACTION_NONE) then

-- mob not already spawned from this

if (trade:hasItemQty(2917,1) == true and trade:hasItemQty(2945,1) == true and trade:hasItemQty(2946,1) == true and trade:getItemCount() == 3) then 
-- Player has all the required items so Spawn NM. 

-- Despawn after inactive for 300 sec (pt has to reclaim within 5 min of a wipe)

SpawnMob(16961919, 300):updateEnmity(player); 

player:tradeComplete();

end

end

end;