-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Combat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 696, 2, dsp.regime.type.GROUNDS)
end
