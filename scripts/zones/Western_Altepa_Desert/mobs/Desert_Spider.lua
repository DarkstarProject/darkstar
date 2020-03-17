-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Desert Spider
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 134, 1, tpz.regime.type.FIELDS)
end
