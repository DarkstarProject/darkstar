-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Soldier Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 128, 2, dsp.regime.type.FIELDS)
end;
