-----------------------------------
-- Area:
--  MOB: Verthandi
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.titles.VERTHANDI_ENSNARER);
end;