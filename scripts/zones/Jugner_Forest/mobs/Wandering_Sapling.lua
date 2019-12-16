-----------------------------------
-- Area: Jugner Forest
--  Mob: Wandering Sapling
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 58, 1, dsp.regime.type.FIELDS)
end
