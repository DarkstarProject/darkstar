-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Hornfly
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 690, 2, dsp.regime.type.GROUNDS)
end;