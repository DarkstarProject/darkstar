-----------------------------------
-- Area: Sauromugue Champaign
--   NM: Blighting Brand
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 100, 2, tpz.regime.type.FIELDS)
end
