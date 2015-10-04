-----------------------------------
-- Zone: Abyssea Altepa
-- NPC: ??? (qm)
-- Spawns  Amarok (E-6)
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

if (trade:hasItemQty(3238,1,3231,1,3232,1) == false) then

-- Player is missing at least one required item.

-- Inform payer what items they need.

player:startEvent(1001, 3238,3231,3232);

elseif (GetMobAction(17670567) == ACTION_NONE) then

-- mob not already spawned from this

if (trade:hasItemQty(3238,1) == true and trade:hasItemQty(3231,1) == true and trade:hasItemQty(3232,1) == true and trade:getItemCount() == 3) then 
-- Player has all the required items so Spawn NM. 

-- Despawn after inactive for 300 sec (pt has to reclaim within 5 min of a wipe)

SpawnMob(17670567, 300):updateEnmity(player); 

player:tradeComplete();

end

end

end;



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    
	    player:addKeyItem(STEAMING_CERBERUS_TONGUE);
        player:messageSpecial(KEYITEM_OBTAINED,STEAMING_CERBERUS_TONGUE);
		
    end
end;