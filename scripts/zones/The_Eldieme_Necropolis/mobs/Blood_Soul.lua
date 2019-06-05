-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Blood Soul
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 674, 2, dsp.regime.type.GROUNDS)
end;