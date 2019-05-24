-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Lich
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 619, 2, dsp.regime.type.GROUNDS)
end
