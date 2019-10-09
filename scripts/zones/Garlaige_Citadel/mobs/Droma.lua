-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Droma
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 707, 1, dsp.regime.type.GROUNDS)
end;