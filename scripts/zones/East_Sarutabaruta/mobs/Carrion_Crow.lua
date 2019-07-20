-----------------------------------
-- Area: East Sarutabaruta
--  Mob: Carrion Crow
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 93, 1, dsp.regime.type.FIELDS)
end;
