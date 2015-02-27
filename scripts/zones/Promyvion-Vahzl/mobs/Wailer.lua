-----------------------------------
-- Area: Promyvion vahzl
-- NPC:  Wailer
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
	GetNPCByID(16867688):hideNPC(900); -- 15m Hide Time?, qm2
end;