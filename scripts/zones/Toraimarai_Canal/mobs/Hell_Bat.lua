-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Hell Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 618, 1, dsp.regime.type.GROUNDS)
end
