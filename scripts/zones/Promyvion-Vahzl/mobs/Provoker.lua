-----------------------------------
-- Area: Promyvion vahzl
-- NPC:  Provoker
-----------------------------------


-----------------------------------
-- onMobSpawn
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	GetNPCByID(16867690):hideNPC(900); -- 15m Hide Time?, qm3
end;