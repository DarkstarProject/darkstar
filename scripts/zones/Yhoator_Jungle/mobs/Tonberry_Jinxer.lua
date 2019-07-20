-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Tonberry Jinxer
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 133, 1, dsp.regime.type.FIELDS)
end
