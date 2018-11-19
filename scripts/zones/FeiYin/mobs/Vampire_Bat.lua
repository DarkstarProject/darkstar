-----------------------------------
-- Area: Fei'Yin
--  MOB: Vampire Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 711, 1, dsp.regime.type.GROUNDS)
end;