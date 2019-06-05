-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Stroper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 660, 2, dsp.regime.type.GROUNDS)
end