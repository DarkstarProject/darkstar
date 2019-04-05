-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Antican Secutor
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 138, 1, dsp.regime.type.FIELDS)
end
