-----------------------------------
-- Area: Quicksand Caves
--  Mob: Sand Digger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 814, 1, dsp.regime.type.GROUNDS)
end;