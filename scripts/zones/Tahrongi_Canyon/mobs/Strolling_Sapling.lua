-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Strolling Sapling
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 30, 1, dsp.regime.type.FIELDS)
end
