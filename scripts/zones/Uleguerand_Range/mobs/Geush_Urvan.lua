-----------------------------------
--  Area:  Uleguerand_Range
--  NPC:   Geush Urvan
--  Notes: Spawned from qm1
-----------------------------------

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
	GetNPCByID(16798095):hideNPC(900);
end;