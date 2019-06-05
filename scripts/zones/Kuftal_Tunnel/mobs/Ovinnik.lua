-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Ovinnik
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 741, 1, dsp.regime.type.GROUNDS)
end