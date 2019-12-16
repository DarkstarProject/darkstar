-----------------------------------
-- Area: Fei'Yin
--   NM: Goliath
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.GOLIATH_KILLER);
end;