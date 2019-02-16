-----------------------------------
-- Area: Outer Horutoto
--  MOB: Six of Cups
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 666, 1, dsp.regime.type.GROUNDS)
end