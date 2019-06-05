-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Mourning Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 726, 3, dsp.regime.type.GROUNDS)
end