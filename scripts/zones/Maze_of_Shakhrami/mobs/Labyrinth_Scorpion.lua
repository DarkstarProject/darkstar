-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Labyrinth Scorpion
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 700, 2, dsp.regime.type.GROUNDS)
end