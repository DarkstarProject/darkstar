-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Antican Essedarius
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 134, 2, dsp.regime.type.FIELDS)
end
