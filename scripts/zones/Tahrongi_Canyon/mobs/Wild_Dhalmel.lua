-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Wild Dhalmel
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 96, 2, dsp.regime.type.FIELDS)
end;
