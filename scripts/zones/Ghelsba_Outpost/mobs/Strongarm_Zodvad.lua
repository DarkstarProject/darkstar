-----------------------------------
-- Area: Ghelsba Outpost
-- NPC:  Strongarm Zodvad
-- Involved in Mission: Save the Children
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	GetMobByID(17350662):updateEnmity(target); -- Fodderchief_Vokdek
	GetMobByID(17350663):updateEnmity(target); -- Sureshot_Snatgat
	--GetMobByID(17350664):updateEnmity(target); -- Strongarm_Zodvad
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, killer)
end;