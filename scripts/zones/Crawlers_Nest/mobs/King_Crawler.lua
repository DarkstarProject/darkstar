-----------------------------------
-- Area: Crawlers' Nest
--  Mob: King Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 693, 1, dsp.regime.type.GROUNDS)
end;