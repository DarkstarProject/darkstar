-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Combat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 728, 2, dsp.regime.type.GROUNDS)
end