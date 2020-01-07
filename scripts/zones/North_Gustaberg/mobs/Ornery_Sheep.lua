-----------------------------------
-- Area: North Gustaberg
--  Mob: Ornery Sheep
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 59, 2, dsp.regime.type.FIELDS)
end
