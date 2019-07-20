-----------------------------------
-- Area: Den of Rancor
--  Mob: Million Eyes
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 800, 1, dsp.regime.type.GROUNDS)
end;