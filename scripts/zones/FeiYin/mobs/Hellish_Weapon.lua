-----------------------------------
-- Area: Fei'Yin
--  Mob: Hellish Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 716, 2, dsp.regime.type.GROUNDS)
end;