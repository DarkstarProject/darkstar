-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Greater Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 731, 2, dsp.regime.type.GROUNDS)
end;