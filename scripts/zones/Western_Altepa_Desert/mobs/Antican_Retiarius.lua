-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Antican Retiarius
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 135, 3, dsp.regime.type.FIELDS)
end
