-----------------------------------
-- Area: Promyvion vahzl
-- NPC:  Deviator
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
	GetNPCByID(16867688):hideNPC(900); -- 15m Hide Time?, qm1
end;