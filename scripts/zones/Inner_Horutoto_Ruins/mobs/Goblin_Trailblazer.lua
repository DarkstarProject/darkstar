-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Goblin Trailblazer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 651, 2, dsp.regime.type.GROUNDS)
end;