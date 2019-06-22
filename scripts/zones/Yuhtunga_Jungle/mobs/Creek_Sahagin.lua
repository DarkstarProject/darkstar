-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Creek Sahagin
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 127, 1, dsp.regime.type.FIELDS)
end;
