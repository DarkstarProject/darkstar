-----------------------------------
-- Area: Dynamis San d'Oria
-- NPC:  Voidstreaker Butchnotch
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:addTimeToDynamis(30);
	SpawnMob(17535385); -- 145
	SpawnMob(17535386); -- 146
	SpawnMob(17535387); -- 147
	SpawnMob(17535389); -- 149
	
end;