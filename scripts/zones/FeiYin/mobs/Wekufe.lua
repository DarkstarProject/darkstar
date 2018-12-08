-----------------------------------
-- Area: Fei'Yin
--  MOB: Wekufe
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 717, 2, dsp.regime.type.GROUNDS)
end;