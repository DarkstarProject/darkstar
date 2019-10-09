-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Mushussu
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 773, 1, dsp.regime.type.GROUNDS)
end