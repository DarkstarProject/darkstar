-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Death Jacket
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 125, 1, dsp.regime.type.FIELDS)
end;
