-----------------------------------
-- Area: The Sanctuary of Zi'Tah
-- NPC: Guardian Treant
-- Involved in Quest: Forge Your Destiny
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function onMobSpawn(mob)
print("hello");
	mob:addStatusEffect(EFFECT_POISON,27,10,300);
end;

function onMobDeath(mob, killer)
	killer:setVar("TheFangedOne_Died",1);
end;
