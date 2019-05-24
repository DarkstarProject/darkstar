-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Carnivorous Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 697, 2, dsp.regime.type.GROUNDS)
end