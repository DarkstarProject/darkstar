-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Wespe
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 790, 2, dsp.regime.type.GROUNDS)
end