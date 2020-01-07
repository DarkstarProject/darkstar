-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Dark Aspic
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 619, 3, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 620, 1, dsp.regime.type.GROUNDS)
end
