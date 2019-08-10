-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Bark Tarantula
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 725, 2, dsp.regime.type.GROUNDS)
end