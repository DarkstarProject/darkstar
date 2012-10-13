-----------------------------------
-- Area: Qu'Bia Arena
-- NPC:  Archlich Taber'quoan
-- Mission 5-1 BCNM Fight
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

	-- Select the mobs from this specific BCNM
	self = mob:getID()
	Sorc_1 = self+1;
	Sorc_2 = self+2;

	-- Spawn and link Warriors when Archlich is attacked
	GetMobByID(Sorc_1):updateEnmity(target)
	GetMobByID(Sorc_2):updateEnmity(target)
	
	for i = self+3, self+6, 1 do
		SpawnMob(i):updateEnmity(target);
	end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:addTitle(ARCHMAGE_ASSASSIN);
	
	-- Despawn Warriors from this specific BCNM
	self = mob:getID();

	for i = self+1, self+6, 1 do
		DespawnMob(i);
	end
	
end;