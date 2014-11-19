-----------------------------------
-- Area: Promyvion vahzl
-- NPC:  Wailer
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
	GetNPCByID(16867689):hideNPC(900); -- 15m Hide Time?, qm2
end;