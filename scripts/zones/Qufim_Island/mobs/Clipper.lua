-----------------------------------
-- Area: Qufim Island
--  Mob: Clipper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 41, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 42, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 43, 2, dsp.regime.type.FIELDS)
end
