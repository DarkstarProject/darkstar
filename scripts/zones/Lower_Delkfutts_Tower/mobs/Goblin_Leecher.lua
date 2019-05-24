-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Goblin Leecher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 777, 2, dsp.regime.type.GROUNDS)
end