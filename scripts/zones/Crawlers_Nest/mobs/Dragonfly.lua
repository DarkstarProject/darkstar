-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Dragonfly
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 691, 3, dsp.regime.type.GROUNDS)
end;