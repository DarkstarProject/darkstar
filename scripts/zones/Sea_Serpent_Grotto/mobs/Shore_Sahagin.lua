-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Shore Sahagin
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 806, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 807, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 808, 1, dsp.regime.type.GROUNDS)
end