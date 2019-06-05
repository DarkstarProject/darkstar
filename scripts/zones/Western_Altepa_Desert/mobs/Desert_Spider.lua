-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Desert Spider
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 134, 1, dsp.regime.type.FIELDS)
end
