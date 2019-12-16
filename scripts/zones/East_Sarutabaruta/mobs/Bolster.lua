-----------------------------------
-- Area: East Sarutabaruta
--  Mob: Bolster
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 92, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 93, 2, dsp.regime.type.FIELDS)
end;
