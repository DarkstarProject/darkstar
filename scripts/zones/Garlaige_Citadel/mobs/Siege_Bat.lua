-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Siege Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 704, 1, dsp.regime.type.GROUNDS)
end;