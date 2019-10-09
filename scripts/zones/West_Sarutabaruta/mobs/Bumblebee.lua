-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Bumblebee
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 61, 2, dsp.regime.type.FIELDS)
end
