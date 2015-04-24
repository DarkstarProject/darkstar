-----------------------------------
-- Area: Den of Rancor
-- NPC:  HakuTaku
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
	GetNPCByID(17433018):hideNPC(900);
end;