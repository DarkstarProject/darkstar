-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Dancing Jewel
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 694, 1, dsp.regime.type.GROUNDS)
end;