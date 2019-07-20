-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Four of Swords
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 663, 3, dsp.regime.type.GROUNDS)
end