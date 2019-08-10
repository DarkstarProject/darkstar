-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Demonic Doll
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 788, 3, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 789, 3, dsp.regime.type.GROUNDS)
end