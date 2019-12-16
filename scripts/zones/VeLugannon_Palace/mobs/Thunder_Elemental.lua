-----------------------------------
-- Area: Ve'Lugannon Palace
--  Mob: Thunder Elemental
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 748, 1, dsp.regime.type.GROUNDS)
end;