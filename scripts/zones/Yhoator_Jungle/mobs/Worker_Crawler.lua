-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Worker Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 132, 1, dsp.regime.type.FIELDS)
end
