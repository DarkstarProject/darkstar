-----------------------------------
-- Area: Sauromugue Champaign
--   NM: Climbpix Highrise
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 97, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 98, 2, dsp.regime.type.FIELDS)
end
