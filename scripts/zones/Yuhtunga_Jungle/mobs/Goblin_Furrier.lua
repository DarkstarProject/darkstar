-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Goblin Furrier
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 125, 2, dsp.regime.type.FIELDS)
end;
