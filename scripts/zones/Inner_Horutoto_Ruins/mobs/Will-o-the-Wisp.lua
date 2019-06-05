-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Will-o-the-Wisp
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 650, 2, dsp.regime.type.GROUNDS)
end;