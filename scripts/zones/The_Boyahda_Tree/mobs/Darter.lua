-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Darter
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 724, 2, dsp.regime.type.GROUNDS)
end