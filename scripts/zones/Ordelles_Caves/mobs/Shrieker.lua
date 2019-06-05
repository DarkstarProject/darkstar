-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Shrieker
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 656, 2, dsp.regime.type.GROUNDS)
end