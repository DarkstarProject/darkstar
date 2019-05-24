-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Jolly Green
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 60, 3, dsp.regime.type.FIELDS)
end
