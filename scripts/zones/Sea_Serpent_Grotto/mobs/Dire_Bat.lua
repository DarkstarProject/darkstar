-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Dire Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 809, 2, dsp.regime.type.GROUNDS)
end