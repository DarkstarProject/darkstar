-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Boggart
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 63, 2, tpz.regime.type.FIELDS)
end
