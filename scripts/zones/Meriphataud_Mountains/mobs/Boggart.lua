-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Boggart
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 63, 2, dsp.regime.type.FIELDS)
end
