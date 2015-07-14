-----------------------------------
-- Area: Beaucedine Glacier
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
	killer:addTitle(title.RUTHVEN_ENTOMBER);
end;