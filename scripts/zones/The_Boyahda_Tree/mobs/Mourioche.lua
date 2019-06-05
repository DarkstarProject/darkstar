-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Mourioche
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 720, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 721, 1, dsp.regime.type.GROUNDS)
end