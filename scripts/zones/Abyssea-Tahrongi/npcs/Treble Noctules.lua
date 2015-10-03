-----------------------------------
-- Zone: Abyssea - Tahrongi
-- NPC: ??? (qm)
-- Spawns Treble Noctules (I-9)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

if (trade:hasItemQty(2919,1,2947,1) == false) then

-- Player is missing at least one required item.

-- Inform payer what items they need.

player:startEvent(1001, 2919,2947);

elseif (GetMobAction(16961921) == ACTION_NONE) then

-- mob not already spawned from this

if (trade:hasItemQty(2919,1) == true and trade:hasItemQty(2947,1) == true and trade:getItemCount() == 2) then 
-- Player has all the required items so Spawn NM. 

-- Despawn after inactive for 300 sec (pt has to reclaim within 5 min of a wipe)

SpawnMob(16961921, 300):updateEnmity(player); 

player:tradeComplete();

end

end

end;