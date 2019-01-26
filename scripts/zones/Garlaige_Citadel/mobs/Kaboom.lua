-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Kaboom
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 709, 2, dsp.regime.type.GROUNDS)
end;