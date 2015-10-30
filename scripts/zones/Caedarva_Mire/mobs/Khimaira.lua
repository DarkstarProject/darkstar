-----------------------------------
-- Area: Caedarva Mire
-- NPC:  Khimaira
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
	killer:addTitle(KHIMAIRA_CARVER);
end;