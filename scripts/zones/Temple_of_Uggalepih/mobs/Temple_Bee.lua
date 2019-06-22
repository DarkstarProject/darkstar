-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Temple Bee
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 790, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 793, 2, dsp.regime.type.GROUNDS)
end