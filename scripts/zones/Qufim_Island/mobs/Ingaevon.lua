-----------------------------------
-- Area: Qufim Island
--   NM: Ingaevon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 44, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 45, 2, dsp.regime.type.FIELDS)
end
