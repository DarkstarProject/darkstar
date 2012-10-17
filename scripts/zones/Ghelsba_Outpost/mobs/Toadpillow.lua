-----------------------------------
-- Area: Ghelsba outpost
-- NPC:  Toadpillow
-- BCNM30
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

	GetMobByID(17350937):updateEnmity(target);
	GetMobByID(17350938):updateEnmity(target);
	GetMobByID(17350939):updateEnmity(target);
end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;
