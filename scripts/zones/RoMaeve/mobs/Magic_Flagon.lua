-----------------------------------
-- Area: RoMaeve
--  MOB: Magic Flagon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 120, 1, dsp.regime.type.FIELDS)
end;
