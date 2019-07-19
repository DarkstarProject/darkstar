-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Temple Opo-opo
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 792, 2, dsp.regime.type.GROUNDS)
end