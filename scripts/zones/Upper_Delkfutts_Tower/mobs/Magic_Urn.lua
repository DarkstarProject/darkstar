-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Magic Urn
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 788, 3, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 789, 3, dsp.regime.type.GROUNDS)
end