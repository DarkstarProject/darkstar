-----------------------------------
-- Area: Yuhtunga Jungle
--   NM: Mischievous Micholas
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 126, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 128, 1, tpz.regime.type.FIELDS)
end
