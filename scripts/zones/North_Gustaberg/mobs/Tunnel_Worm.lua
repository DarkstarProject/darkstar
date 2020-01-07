-----------------------------------
-- Area: North Gustaberg
--  Mob: Tunnel Worm
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 16, 1, dsp.regime.type.FIELDS)
end
