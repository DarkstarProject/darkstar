-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Greater Gaylas
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 763, 3, dsp.regime.type.GROUNDS)
end;