-----------------------------------
-- Area: Beaucedine Glacier
-- NPC:  Lord Ruthven
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
	killer:addTitle(RUTHVEN_ENTOMBER);
end;