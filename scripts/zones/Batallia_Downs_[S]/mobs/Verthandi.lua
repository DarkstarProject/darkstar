-----------------------------------
-- Area: Batallia_Downs_[S]
--  MOB: Verthandi
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(VERTHANDI_ENSNARER);
end;