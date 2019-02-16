-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Stink Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 695, 2, dsp.regime.type.GROUNDS)
end
