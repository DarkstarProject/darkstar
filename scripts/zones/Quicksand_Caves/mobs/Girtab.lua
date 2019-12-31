-----------------------------------
-- Area: Quicksand Caves
--  Mob: Girtab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 818, 1, dsp.regime.type.GROUNDS)
end;