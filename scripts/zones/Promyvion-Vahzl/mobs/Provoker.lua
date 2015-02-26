-----------------------------------
-- Area: Promyvion vahzl
-- NPC:  Provoker
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
	GetNPCByID(16867689):hideNPC(900); -- 15m Hide Time?, qm3
end;