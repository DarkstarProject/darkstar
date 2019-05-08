-----------------------------------
-- Area: Meriphataud Mountains
--   NM: Tsaagan
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 39, 1, dsp.regime.type.FIELDS)
end
