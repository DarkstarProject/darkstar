-----------------------------------
-- Area: Outer Horutoto
--  MOB: Eight of Batons
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 667, 2, dsp.regime.type.GROUNDS)
end