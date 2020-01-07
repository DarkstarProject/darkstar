-----------------------------------
-- Area: Fei'Yin
--  Mob: Killing Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 716, 1, dsp.regime.type.GROUNDS)
end;