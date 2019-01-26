-----------------------------------
-- Area: Sea Serpent Grotto
--  MOB: Dire Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 809, 2, dsp.regime.type.GROUNDS)
end