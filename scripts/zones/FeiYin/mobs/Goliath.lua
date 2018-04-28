-----------------------------------
-- Area: Fei'Yin
--  NM:  Goliath
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.titles.GOLIATH_KILLER);
end;