-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Death Wasp
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 25, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 85, 1, dsp.regime.type.FIELDS)
end
