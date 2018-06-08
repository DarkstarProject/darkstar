-----------------------------------
-- Area: Batallia_Downs_[S]
--  MOB: Dark Ixion
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.IXION_HORNBREAKER);
end;