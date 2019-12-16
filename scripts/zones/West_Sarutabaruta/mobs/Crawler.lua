-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 28, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 29, 2, dsp.regime.type.FIELDS)
end
