-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Rumble Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 691, 1, dsp.regime.type.GROUNDS)
end;