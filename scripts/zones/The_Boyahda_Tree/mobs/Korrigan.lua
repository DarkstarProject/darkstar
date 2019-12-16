-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Korrigan
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 722, 1, dsp.regime.type.GROUNDS)
end