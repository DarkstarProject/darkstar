-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Huge Wasp
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 81, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 82, 1, dsp.regime.type.FIELDS)
end
