-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Goliath Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 660, 1, dsp.regime.type.GROUNDS)
end