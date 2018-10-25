-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Robber Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 720, 2, dsp.regime.type.GROUNDS)
end;