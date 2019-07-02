-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Rock Eater
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 634, 2, dsp.regime.type.GROUNDS)
end