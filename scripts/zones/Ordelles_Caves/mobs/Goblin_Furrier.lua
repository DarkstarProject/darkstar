-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Goblin Furrier
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 657, 1, dsp.regime.type.GROUNDS)
end