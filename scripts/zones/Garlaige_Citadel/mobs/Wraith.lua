-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Wraith
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 708, 3, dsp.regime.type.GROUNDS)
end;