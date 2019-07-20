-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Flume Toad
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 625, 1, dsp.regime.type.GROUNDS)
end
