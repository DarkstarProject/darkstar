-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Bloodsucker
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 620, 2, dsp.regime.type.GROUNDS)
end
