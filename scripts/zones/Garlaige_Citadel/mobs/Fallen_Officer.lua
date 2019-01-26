-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Fallen Officer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 703, 2, dsp.regime.type.GROUNDS)
end;