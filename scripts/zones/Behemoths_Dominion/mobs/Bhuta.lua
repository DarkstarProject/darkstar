-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Bhuta
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 103, 2, dsp.regime.type.FIELDS)
end;
