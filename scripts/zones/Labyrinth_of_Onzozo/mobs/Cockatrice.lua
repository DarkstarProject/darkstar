-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Cockatrice
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 772, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 773, 2, dsp.regime.type.GROUNDS)
end