-----------------------------------
-- Area: North Gustaberg
--  Mob: Rock Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 19, 2, dsp.regime.type.FIELDS)
end
