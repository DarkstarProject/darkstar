-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Maze Maker
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 696, 1, dsp.regime.type.GROUNDS)
end;
