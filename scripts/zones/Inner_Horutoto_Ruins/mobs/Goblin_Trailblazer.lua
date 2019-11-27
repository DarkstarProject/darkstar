-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Goblin Trailblazer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 651, 2, dsp.regime.type.GROUNDS)
end