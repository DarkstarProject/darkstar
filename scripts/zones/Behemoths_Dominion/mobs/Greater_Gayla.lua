-----------------------------------
-- Area: Behemoths Dominion
--  Mob: Greater Gayla
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 101, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 103, 1, dsp.regime.type.FIELDS)
end;
