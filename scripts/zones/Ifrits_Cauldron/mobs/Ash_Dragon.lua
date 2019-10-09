-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Ash Dragon
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.DRAGON_ASHER);
end;

function onMobDespawn(mob)

    -- Set ASh Dragon's spawnpoint and respawn time (3-5 Days)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(259200,432000));
end;
