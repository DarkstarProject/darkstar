-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Goblin Flesher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 652, 2, dsp.regime.type.GROUNDS)
end