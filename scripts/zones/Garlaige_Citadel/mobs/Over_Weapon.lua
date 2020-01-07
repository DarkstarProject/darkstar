-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Over Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 705, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 708, 1, dsp.regime.type.GROUNDS)
end;