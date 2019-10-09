-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Nest Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 688, 2, dsp.regime.type.GROUNDS)
end;