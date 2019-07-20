-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Goblin Headsman
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 640, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 643, 2, dsp.regime.type.GROUNDS)
end;