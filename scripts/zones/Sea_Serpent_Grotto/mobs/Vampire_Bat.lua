-----------------------------------
-- Area: Sea Serpent Grotto
--  MOB: Vampire Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 806, 2, dsp.regime.type.GROUNDS)
end