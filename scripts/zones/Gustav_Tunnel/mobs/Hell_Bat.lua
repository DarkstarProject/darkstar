-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Hell Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 763, 3, tpz.regime.type.GROUNDS)
end;