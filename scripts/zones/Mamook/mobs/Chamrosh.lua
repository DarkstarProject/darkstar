-----------------------------------
-- Area: Mamook
-- NPC:  Gulool Ja Ja
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_ACC,75);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_REGAIN,33);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;