-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Makara
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 127, 2, dsp.regime.type.FIELDS)
end;
