-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Boggart
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 63, 2, dsp.regime.type.FIELDS)
end
