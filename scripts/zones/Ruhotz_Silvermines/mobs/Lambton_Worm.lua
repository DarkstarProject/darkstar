-----------------------------------
-- Area: BCNM
-- NPC:  Lambton Worm
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:setTitle(LAMBTON_WORM_DESEGMENTER);
end;