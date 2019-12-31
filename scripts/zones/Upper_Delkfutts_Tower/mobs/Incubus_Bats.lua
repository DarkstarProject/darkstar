-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Incubus Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 786, 3, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 787, 3, dsp.regime.type.GROUNDS)
end