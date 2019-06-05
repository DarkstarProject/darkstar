-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Mushussu
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 773, 1, dsp.regime.type.GROUNDS)
end