-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Viseclaw
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 726, 1, dsp.regime.type.GROUNDS)
end