-----------------------------------
-- Area: Fei'Yin
--  Mob: Balayang
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 717, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 718, 1, dsp.regime.type.GROUNDS)
end;