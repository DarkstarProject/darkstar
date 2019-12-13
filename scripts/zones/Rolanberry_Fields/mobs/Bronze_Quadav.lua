-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Bronze Quadav
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 87, 2, dsp.regime.type.FIELDS)
end
