-----------------------------------
-- Area: BCNM
-- NPC:  Lambton Worm
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(TITLE_LAMBTON_WORM_DESEGMENTER);
end;