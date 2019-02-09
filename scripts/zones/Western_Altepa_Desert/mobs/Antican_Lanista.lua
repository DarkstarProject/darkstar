-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Antican Lanista
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 138, 2, dsp.regime.type.FIELDS)
end
