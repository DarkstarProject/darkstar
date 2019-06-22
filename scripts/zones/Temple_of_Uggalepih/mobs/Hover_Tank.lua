-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Hover Tank
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 794, 2, dsp.regime.type.GROUNDS)
end