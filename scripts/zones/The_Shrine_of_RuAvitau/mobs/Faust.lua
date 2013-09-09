-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Faust
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
	mob:setRespawnTime(math.random((10800),(21600))); -- respawn 3-6 hrs
end;