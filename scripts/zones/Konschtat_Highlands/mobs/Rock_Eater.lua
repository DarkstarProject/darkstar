-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Rock Eater
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 20, 1, dsp.regime.type.FIELDS)
end
