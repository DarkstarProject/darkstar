-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Panna Cotta
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 614, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 615, 2, dsp.regime.type.GROUNDS)
end
