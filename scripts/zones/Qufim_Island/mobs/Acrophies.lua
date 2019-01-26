-----------------------------------
-- Area: Qufim Island
--  MOB: Acrophies
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 45, 1, dsp.regime.type.FIELDS)
end
