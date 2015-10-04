-----------------------------------
-- Zone: Abyssea Altepa
-- NPC: ??? (qm)
-- Spawns Shaula (H-8)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

if (trade:hasItemQty(3242,1,3233,1) == false) then

-- Player is missing at least one required item.

-- Inform payer what items they need.

player:startEvent(1001, 3242,3233);

elseif (GetMobAction(17670570) == ACTION_NONE) then

-- mob not already spawned from this

if (trade:hasItemQty(3242,1) == true and trade:hasItemQty(3233,1) == true and trade:getItemCount() == 2) then 
-- Player has all the required items so Spawn NM. 

-- Despawn after inactive for 300 sec (pt has to reclaim within 5 min of a wipe)

SpawnMob(17670570, 300):updateEnmity(player); 

player:tradeComplete();

end

end

end;