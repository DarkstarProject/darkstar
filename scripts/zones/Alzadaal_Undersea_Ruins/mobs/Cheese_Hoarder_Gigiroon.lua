-----------------------------------
-- Area: Alzadall Undersea Ruins
-- NPC:  Cheese Hoarder Gigiroon
-- POS: -180, -7, 22

-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_ATT,250);
	mob:addMod(MOD_DEX,125);
	mob:addMod(MOD_AGI,125);
	mob:addMod(MOD_DEF,75);
	mob:addMod(MOD_ACC,75);
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