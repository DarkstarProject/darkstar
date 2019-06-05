-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Babaulas
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 776, 1, dsp.regime.type.GROUNDS)
end