-----------------------------------
-- Area: Ghelsba outpost
-- NPC:  Furies
-- BCNM20
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
	GetMobByID(17350929):updateClaim(target);
	GetMobByID(17350930):updateClaim(target);
	GetMobByID(17350931):updateClaim(target);
end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;
