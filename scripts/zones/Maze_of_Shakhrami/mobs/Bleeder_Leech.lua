-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Bleeder Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 701, 2, dsp.regime.type.GROUNDS)
end