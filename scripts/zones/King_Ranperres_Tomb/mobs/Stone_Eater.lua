-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Stone Eater
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 632, 1, dsp.regime.type.GROUNDS)
end;