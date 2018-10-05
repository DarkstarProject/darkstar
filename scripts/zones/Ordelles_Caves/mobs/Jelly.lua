-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Jelly
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 659, 2, dsp.regime.type.GROUNDS)
end;