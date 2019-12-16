-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Makara
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 764, 2, dsp.regime.type.GROUNDS)
end;