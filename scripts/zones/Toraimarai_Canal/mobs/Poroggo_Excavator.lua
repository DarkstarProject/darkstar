-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Poroggo Excavator
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 625, 2, dsp.regime.type.GROUNDS)
end
