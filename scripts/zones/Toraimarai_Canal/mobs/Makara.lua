-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Makara
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 618, 2, dsp.regime.type.GROUNDS)
end
