-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Darter
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 724, 2, dsp.regime.type.GROUNDS)
end