-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Goblin Furrier
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 695, 1, tpz.regime.type.GROUNDS)
end
