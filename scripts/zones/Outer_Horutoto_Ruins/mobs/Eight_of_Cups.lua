-----------------------------------
-- Area: Outer Horutoto
--  MOB: Eight of Cups
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 667, 1, dsp.regime.type.GROUNDS)
end