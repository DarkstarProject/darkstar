-----------------------------------
-- Area: Fei'Yin
--  Mob: Shadow
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 712, 1, dsp.regime.type.GROUNDS)
end;