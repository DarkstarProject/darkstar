-----------------------------------
-- Area: Jugner_Forest_[S]
--  MOB: Dark Ixion
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(IXION_HORNBREAKER);
end;