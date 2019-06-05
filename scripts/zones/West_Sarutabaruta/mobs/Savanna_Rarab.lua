-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Savanna Rarab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 27, 1, dsp.regime.type.FIELDS)
end
