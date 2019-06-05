-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Mandragora
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 89, 1, dsp.regime.type.FIELDS)
end;
