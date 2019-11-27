-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Skinnymajinx
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 654, 2, dsp.regime.type.GROUNDS)
end