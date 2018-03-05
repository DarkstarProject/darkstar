-----------------------------------
-- Area: Fei'Yin
--  NM:  Goliath
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(GOLIATH_KILLER);
end;