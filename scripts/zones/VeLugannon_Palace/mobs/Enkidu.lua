-----------------------------------
-- Area: Ve'Lugannon Palace
--  Mob: Enkidu
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 743, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 747, 1, dsp.regime.type.GROUNDS)
end;