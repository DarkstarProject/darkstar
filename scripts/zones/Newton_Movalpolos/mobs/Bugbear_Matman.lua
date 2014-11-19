-----------------------------------
-- Area: Newton Movalpolos
-- NPC:   Moblin Showman
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
	GetNPCByID(16826574):hideNPC(900); -- Moblin Showman in NPC_List
end;