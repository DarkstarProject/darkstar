-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Desert Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 136, 1, dsp.regime.type.FIELDS)
end
