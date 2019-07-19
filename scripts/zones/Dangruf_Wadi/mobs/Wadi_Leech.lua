-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Wadi Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 641, 2, dsp.regime.type.GROUNDS)
end;