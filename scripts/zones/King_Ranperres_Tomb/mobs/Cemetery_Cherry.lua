-----------------------------------
-- Area: King Ranperres Tomb
-- NPC:  Cemetery Cherry
-- @pos 33.000 0.500 -287.000 190
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(MON_CHERRY);
end;