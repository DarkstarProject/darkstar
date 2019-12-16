-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Seven of Swords
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 666, 3, dsp.regime.type.GROUNDS)
end