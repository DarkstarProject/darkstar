-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Goblin Bushwhacker
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 640, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 645, 3, dsp.regime.type.GROUNDS)
end;