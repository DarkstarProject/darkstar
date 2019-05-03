-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Ghast
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 805, 2, dsp.regime.type.GROUNDS)
end