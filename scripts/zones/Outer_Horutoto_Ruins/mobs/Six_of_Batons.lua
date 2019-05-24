-----------------------------------
-- Area: Outer Horutoto
--  MOB: Six of Batons
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 665, 2, dsp.regime.type.GROUNDS)
end