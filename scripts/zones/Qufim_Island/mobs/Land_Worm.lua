-----------------------------------
-- Area: Qufim Island
--  MOB: Land Worm
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 41, 2, dsp.regime.type.FIELDS)
end
