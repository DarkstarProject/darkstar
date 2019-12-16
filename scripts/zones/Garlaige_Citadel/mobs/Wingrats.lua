-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Wingrats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 703, 1, dsp.regime.type.GROUNDS)
end;