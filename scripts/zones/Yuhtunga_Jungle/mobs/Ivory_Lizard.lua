-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Ivory Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 124, 2, dsp.regime.type.FIELDS)
end;
