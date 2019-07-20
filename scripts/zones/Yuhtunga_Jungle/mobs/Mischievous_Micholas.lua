-----------------------------------
-- Area: Yuhtunga Jungle
--   NM: Mischievous Micholas
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 126, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 128, 1, dsp.regime.type.FIELDS)
end
