-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Helm Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 692, 1, dsp.regime.type.GROUNDS)
end;