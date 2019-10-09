-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Ancient Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 698, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 699, 2, dsp.regime.type.GROUNDS)
end