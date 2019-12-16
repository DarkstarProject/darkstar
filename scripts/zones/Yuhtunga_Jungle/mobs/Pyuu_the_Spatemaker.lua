-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Pyuu the Spatemaker
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 127, 1, dsp.regime.type.FIELDS)
end;
