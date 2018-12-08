-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Worker Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 687, 1, dsp.regime.type.GROUNDS)
end;