-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Bilis Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 662, 1, dsp.regime.type.GROUNDS)
end