-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Dabilla
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 612, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 614, 1, dsp.regime.type.GROUNDS)
end
