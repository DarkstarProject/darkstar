-----------------------------------
-- Area: Quicksand Caves
--  Mob: Sabotender Bailaor
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 816, 1, dsp.regime.type.GROUNDS)
end;