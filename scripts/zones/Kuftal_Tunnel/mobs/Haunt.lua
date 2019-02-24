-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Haunt
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 736, 2, dsp.regime.type.GROUNDS)
end