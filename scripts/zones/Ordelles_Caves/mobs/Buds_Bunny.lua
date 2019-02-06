-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Buds Bunny
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 661, 1, dsp.regime.type.GROUNDS)
end