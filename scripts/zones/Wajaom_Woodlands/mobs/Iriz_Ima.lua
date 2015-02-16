-----------------------------------
-- Area: Wajaom Woodlands
-- NPC:  Iriz_Ima


-----------------------------------
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
	mob:addMod(MOD_ATT,90);
	mob:addMod(MOD_DEF,75);
	mob:addMod(MOD_MACC,500);
    mob:addMod(MOD_REGAIN,33);
end;

function onMobFight(mob, target)
end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)	
end;