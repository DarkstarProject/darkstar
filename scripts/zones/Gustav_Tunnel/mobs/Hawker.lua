-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Hawker
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 764, 1, dsp.regime.type.GROUNDS)
end;