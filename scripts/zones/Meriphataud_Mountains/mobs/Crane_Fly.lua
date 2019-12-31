-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Crane Fly
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 36, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 37, 2, dsp.regime.type.FIELDS)
end
