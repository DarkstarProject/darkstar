-----------------------------------
-- Area: Gusgen Mines
--  MOB: Madfly
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 686, 2, dsp.regime.type.GROUNDS)
end;