-----------------------------------
-- Area: East Sarutabaruta
--  Mob: Giant Bee
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 90, 1, dsp.regime.type.FIELDS)
end;
