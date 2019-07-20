-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Borer Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 704, 2, dsp.regime.type.GROUNDS)
end;