-----------------------------------
-- Area: Fei'Yin
--  MOB: Underworld Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 713, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 714, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 715, 1, dsp.regime.type.GROUNDS)
end;