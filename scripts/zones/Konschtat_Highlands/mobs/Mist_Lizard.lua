-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Mist Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 20, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 82, 2, dsp.regime.type.FIELDS)
end
