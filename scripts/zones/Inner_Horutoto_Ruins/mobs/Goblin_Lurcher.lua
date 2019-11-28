-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Goblin Lurcher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 654, 1, dsp.regime.type.GROUNDS)
end