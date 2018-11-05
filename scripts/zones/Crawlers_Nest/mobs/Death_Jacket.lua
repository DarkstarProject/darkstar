-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Death Jacket
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 687, 2, dsp.regime.type.GROUNDS)
end;