-----------------------------------
-- Area: Riverne - Site B01
--  NM:  Boroka
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(BOROKA_BELEAGUERER);
    mob:setRespawnTime(math.random(75600,86400)); -- 21-24 hour respawn
end;