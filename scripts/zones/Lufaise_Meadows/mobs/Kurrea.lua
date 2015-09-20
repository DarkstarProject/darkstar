-----------------------------------
-- Area: Lufaise Meadows
-- NPC:  Kurrea
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
	GetNPCByID(16875885):hideNPC(900);
end;