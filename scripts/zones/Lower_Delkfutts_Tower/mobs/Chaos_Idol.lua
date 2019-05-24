-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Chaos Idol
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 779, 2, dsp.regime.type.GROUNDS)
end