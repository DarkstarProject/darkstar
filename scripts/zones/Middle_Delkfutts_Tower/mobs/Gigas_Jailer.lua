-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Gigas Jailer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 783, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 784, 2, dsp.regime.type.GROUNDS)
end