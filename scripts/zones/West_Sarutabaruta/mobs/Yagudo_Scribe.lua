-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Yagudo Scribe
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 29, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 61, 1, dsp.regime.type.FIELDS)
end
