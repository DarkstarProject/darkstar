-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  Ash Dragon
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
    killer:addTitle(TITLE_DRAGON_ASHER);

    -- Set ASh Dragon's spawnpoint and respawn time (3-5 Days)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((259200),(432000)));
end;