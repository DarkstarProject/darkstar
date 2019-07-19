-----------------------------------
-- Area: Quicksand Caves
--  Mob: Antican Quaestor
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 812, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 813, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 814, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 815, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 816, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 817, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 818, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 819, 2, dsp.regime.type.GROUNDS)
end;