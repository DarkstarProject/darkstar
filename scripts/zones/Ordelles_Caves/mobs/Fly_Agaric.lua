-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Fly Agaric
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 656, 1, dsp.regime.type.GROUNDS)
end