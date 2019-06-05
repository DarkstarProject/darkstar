-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Skimmer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 723, 1, dsp.regime.type.GROUNDS)
end