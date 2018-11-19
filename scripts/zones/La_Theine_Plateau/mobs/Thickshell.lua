-----------------------------------
-- Area: La Theine Plateau
--  MOB: Thickshell
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 70, 2, dsp.regime.type.FIELDS)
end;
