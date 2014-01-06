-----------------------------------
-- Area: Upper Delkfutt's Tower
-- NPC:  Pallas
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
	GetNPCByID(17424519):hideNPC(900); -- qm2 in npc_list
end;