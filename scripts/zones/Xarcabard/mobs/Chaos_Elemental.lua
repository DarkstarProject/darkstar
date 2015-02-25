-----------------------------------
-- Area: Xarcabard
-- MOB:  Chaos Elemental
-- Spawned for Quest: The Three Magi
-- @pos -335.245 -26.403 -49.190 112
-----------------------------------


-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	GetNPCByID(17236279):hideNPC(600); -- qm1
end;