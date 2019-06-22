-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Abyss Worm
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 699, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 700, 1, dsp.regime.type.GROUNDS)
end