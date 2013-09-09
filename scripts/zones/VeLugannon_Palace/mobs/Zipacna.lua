-----------------------------------
-- Area: VeLugannon Palace
-- NPC:  Zipacna
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	mob:setRespawnTime(math.random((10800),(14400))); -- respawn 3-4 hrs
end;