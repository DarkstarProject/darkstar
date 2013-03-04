-----------------------------------
-- Area: Sacrificial Chamber
-- NPC:  Molyb'Iton
-- Zilart Mission 4 BCNM Fight
----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	local mobid = mob:getID();

	for i=mobid-1,mobid+2 do
		GetMobByID(i):updateEnmity(target);
	end
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;