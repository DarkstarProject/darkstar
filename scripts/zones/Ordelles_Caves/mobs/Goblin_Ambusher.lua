-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Goblin Ambusher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 657, 1, dsp.regime.type.GROUNDS)
end