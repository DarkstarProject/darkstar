-----------------------------------
-- Area: Meriphataud Mountains
--   NM: Daggerclaw Dracos
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 39, 1, tpz.regime.type.FIELDS)
end
