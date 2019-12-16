-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Trimmer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 646, 1, dsp.regime.type.GROUNDS)
end;