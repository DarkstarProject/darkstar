-----------------------------------
-- Area: Outer Horutoto
--  MOB: Four of Batons
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 663, 2, dsp.regime.type.GROUNDS)
end