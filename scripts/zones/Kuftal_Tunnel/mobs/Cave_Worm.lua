-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Cave Worm
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 737, 1, dsp.regime.type.GROUNDS)
end