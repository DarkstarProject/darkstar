-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Jolly Green
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 60, 3, tpz.regime.type.FIELDS)
end
