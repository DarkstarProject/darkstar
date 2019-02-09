-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Drowned Bones
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 624, 2, dsp.regime.type.GROUNDS)
end
