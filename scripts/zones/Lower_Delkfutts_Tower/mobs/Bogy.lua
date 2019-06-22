-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Bogy
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 780, 2, dsp.regime.type.GROUNDS)
end