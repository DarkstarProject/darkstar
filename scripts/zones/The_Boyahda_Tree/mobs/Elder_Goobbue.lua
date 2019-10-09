-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Elder Goobbue
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 722, 2, dsp.regime.type.GROUNDS)
end