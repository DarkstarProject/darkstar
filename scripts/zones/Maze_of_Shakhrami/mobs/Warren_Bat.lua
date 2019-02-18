-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Warren Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 702, 1, dsp.regime.type.GROUNDS)
end