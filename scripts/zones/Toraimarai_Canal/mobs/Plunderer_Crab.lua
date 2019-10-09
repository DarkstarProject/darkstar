-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Plunderer Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 623, 1, dsp.regime.type.GROUNDS)
end
