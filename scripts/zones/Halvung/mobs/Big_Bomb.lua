-----------------------------------
-- Area: Halvung
-- NPC:  Big Bomb
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
	GetNPCByID(17031608):hideNPC(900);
end;