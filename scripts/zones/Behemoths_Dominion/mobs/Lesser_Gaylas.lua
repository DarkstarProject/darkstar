-----------------------------------
-- Area: Behemoths Dominion
--  Mob: Lesser Gaylas
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 101, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 102, 1, dsp.regime.type.FIELDS)
end;
