-----------------------------------
-- Area: Horlais Peak
--  MOB: Dread Dragon
-- Mission 2-3 BCNM Fight
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(DREAD_DRAGON_SLAYER);
end;