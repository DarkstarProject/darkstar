-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Spool Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 734, 2, dsp.regime.type.GROUNDS)
end;