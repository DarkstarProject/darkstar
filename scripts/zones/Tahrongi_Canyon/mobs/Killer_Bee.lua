-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Killer Bee
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 30, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 95, 2, dsp.regime.type.FIELDS)
end
