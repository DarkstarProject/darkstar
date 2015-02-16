-----------------------------------
-- Area: Wajaom Woodlands
-- NPC:  Vulpangue -693.470, -7.500, -127.744  

-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------
function onMobInitialize(mob)
	mob:addMod(MOD_ATT,200);
	mob:addMod(MOD_STR,125);
	mob:addMod(MOD_DEF,75);
	mob:addMod(MOD_ACC,75);
	mob:addMod(MOD_MACC,500);
    mob:addMod(MOD_REGAIN,33);
end;
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;


function onMobEngaged(mob, target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)	
end;