-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Pygmaioi
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 94, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 95, 1, dsp.regime.type.FIELDS)
end
