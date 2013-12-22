-----------------------------------
-- Area: Uleguaerand Range
-- NPC:  Jormungand
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
	killer:addTitle(WORLD_SERPENT_SLAYER);
    mob:setRespawnTime(math.random((259200),(432000)));	-- 3 to 5 days
end;