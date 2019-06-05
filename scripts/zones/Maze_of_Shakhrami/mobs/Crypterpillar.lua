-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Crypterpillar
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 702, 2, dsp.regime.type.GROUNDS)
end