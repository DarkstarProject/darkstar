-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Will-o-the-Wisp
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 657, 2, dsp.regime.type.GROUNDS)
end