-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Antican Retiarius
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 135, 3, tpz.regime.type.FIELDS)
end
