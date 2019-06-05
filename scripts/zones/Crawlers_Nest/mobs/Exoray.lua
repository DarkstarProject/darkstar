-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Exoray
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 690, 1, dsp.regime.type.GROUNDS)
end;