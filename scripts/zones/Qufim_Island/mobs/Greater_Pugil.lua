-----------------------------------
-- Area: Qufim Island
--  Mob: Greater Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 43, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 44, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 45, 3, dsp.regime.type.FIELDS)
end
