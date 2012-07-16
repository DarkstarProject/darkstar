-----------------------------------
-- Area: Sacrificial Chamber
-- NPC:  Tungs'Iton
-- Zilart Mission 4 BCNM Fight
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	rand = math.random(1,2);
	
	if(rand == 1) then
		SpawnMob(17444868); -- elemental
	else
		SpawnMob(17444869); -- avatar
	end
	
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
	
	if(GetMobAction(17444868) ~= 0) then
		DespawnMob(17444868);
	elseif(GetMobAction(17444869) ~= 0) then
		DespawnMob(17444869);
	end
	
end;