-----------------------------------
-- Area: Den of Rancor
--  Mob: Cave Worm
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 796, 2, dsp.regime.type.GROUNDS)
end;