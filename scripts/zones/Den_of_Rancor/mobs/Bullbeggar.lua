-----------------------------------
-- Area: Den of Rancor
--  MOB: Bullbeggar
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 803, 2, dsp.regime.type.GROUNDS)
end;