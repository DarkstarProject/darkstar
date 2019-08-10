-----------------------------------
-- Area: Ve'Lugannon Palace
--  Mob: Caretaker
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 743, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 746, 1, dsp.regime.type.GROUNDS)
end;