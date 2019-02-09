-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Fallen Knight
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 619, 1, dsp.regime.type.GROUNDS)
end
