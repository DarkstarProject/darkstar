-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Boribaba
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 776, 2, dsp.regime.type.GROUNDS)
end