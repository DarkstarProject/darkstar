-----------------------------------
-- Area: Caedarva Mire
-- NPC:  Khimaira
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
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(KHIMAIRA_CARVER);
end;