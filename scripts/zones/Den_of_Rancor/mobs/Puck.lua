-----------------------------------
-- Area: Den of Rancor
--  MOB: Puck
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 802, 2, dsp.regime.type.GROUNDS)
end;