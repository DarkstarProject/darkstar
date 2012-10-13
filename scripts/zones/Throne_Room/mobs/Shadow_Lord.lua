-----------------------------------
-- Area: Throne Room
-- NPC:  Shadow Lord
-- Mission 5-2 BCNM Fight
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	
	-- At 50% HP new CS and change mob
	if(mob:getID() <= 17453059 and mob:getHP() <= (mob:getMaxHP() / 2)) then 
		target:startEvent(0x7d04);
		DespawnMob(mob:getID());
		SpawnMob(mob:getID() + 3);
	end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	killer:addTitle(SHADOW_BANISHER);
end;