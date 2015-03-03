-----------------------------------
-- Area: Promyvion vahzl
-- NPC:  Deviator
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
	GetNPCByID(16867687):hideNPC(900); -- 15m Hide Time?, qm1
end;