-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Targe Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 661, 2, dsp.regime.type.GROUNDS)
end