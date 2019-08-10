-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Rock Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 639, 2, dsp.regime.type.GROUNDS)
end;
