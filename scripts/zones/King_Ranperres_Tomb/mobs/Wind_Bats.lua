-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Wind Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 632, 2, dsp.regime.type.GROUNDS)
end;