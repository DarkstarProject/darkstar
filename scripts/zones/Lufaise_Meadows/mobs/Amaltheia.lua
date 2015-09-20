-----------------------------------
-- Area: Lufaise Meadows
-- NPC:  Amaltheia
-- @pos 347.897 -10.895 264.382 24
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
	GetNPCByID(16875889):hideNPC(900);
end;