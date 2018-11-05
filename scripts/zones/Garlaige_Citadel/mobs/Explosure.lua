-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Explosure
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 706, 2, dsp.regime.type.GROUNDS)
end;