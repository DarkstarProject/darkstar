-----------------------------------
-- Area: BCNM
--  MOB: Lambton Worm
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(LAMBTON_WORM_DESEGMENTER);
end;