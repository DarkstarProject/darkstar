-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Bakru
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 26, 1, dsp.regime.type.FIELDS)
end
