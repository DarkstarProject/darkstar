-----------------------------------
-- Area: Ghelsba outpost
-- NPC:  Toadsquab
-- BCNM30
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;


-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	GetMobByID(17350936):updateClaim(target);
	GetMobByID(17350938):updateClaim(target);
	GetMobByID(17350939):updateClaim(target);
end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;
