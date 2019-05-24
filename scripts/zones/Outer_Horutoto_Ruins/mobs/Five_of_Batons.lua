-----------------------------------
-- Area: Outer Horutoto
--  MOB: Five of Batons
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 664, 2, dsp.regime.type.GROUNDS)
end