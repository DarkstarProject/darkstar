-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Greater Quadav
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 60, 1, tpz.regime.type.FIELDS)
end
