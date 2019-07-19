-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Chaser Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 701, 1, dsp.regime.type.GROUNDS)
end