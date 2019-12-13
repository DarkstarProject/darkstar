-----------------------------------
-- Area: Den of Rancor
--  Mob: Dire Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 796, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 797, 1, dsp.regime.type.GROUNDS)
end;