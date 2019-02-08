-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Thread Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 655, 2, dsp.regime.type.GROUNDS)
end