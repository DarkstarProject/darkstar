-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Caterchipillar
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 698, 1, dsp.regime.type.GROUNDS)
end