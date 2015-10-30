-----------------------------------
-- Area: Konschtat Highlands
-- NPC:  Stray_Mary
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
	killer:addTitle(MARYS_GUIDE);
end;