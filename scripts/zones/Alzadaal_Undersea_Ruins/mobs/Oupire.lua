-----------------------------------
-- Area:
--  MOB: Oupire
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.titles.OUPIRE_IMPALER);
end;