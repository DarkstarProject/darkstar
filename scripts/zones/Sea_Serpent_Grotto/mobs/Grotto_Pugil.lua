-----------------------------------
-- Area: Sea Serpent Grotto
--  MOB: Grotto Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 808, 2, dsp.regime.type.GROUNDS)
end