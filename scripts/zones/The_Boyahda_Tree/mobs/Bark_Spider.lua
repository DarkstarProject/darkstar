-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Bark Spider
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 719, 2, dsp.regime.type.GROUNDS)
end