-----------------------------------
-- Area: Halvung
-- NPC:  Gurfurlur the Menacing
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
	mob:addMod(MOD_MATT,75);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_ACC,250);
	mob:addMod(MOD_REGAIN,33);	
	mob:addMod(MOD_ATT,50);
	mob:addMod(MOD_DEF,50);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function OnMobEngaged(mob,target)
	
	SpawnMob(17031593,180):updateEnmity(target);
	SpawnMob(17031594,180):updateEnmity(target);
	SpawnMob(17031595,180):updateEnmity(target);
	SpawnMob(17031596,180):updateEnmity(target);
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(TROLL_SUBJUGATOR);
end;