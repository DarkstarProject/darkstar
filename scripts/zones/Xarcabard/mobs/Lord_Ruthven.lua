-----------------------------------
-- Area: Xarcabard
-- NPC:  Lord Ruthven
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
	killer:addTitle(TITLE_RUTHVEN_ENTOMBER);
end;