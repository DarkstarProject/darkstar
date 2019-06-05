-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Labyrinth Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 771, 1, dsp.regime.type.GROUNDS)
end