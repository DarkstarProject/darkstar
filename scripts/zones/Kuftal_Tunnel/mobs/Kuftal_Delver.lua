-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Kuftal Delver
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 742, 1, dsp.regime.type.GROUNDS)
end