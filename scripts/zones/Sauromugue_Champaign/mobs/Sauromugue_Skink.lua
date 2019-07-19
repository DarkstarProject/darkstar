-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Sauromugue Skink
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 97, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 99, 1, dsp.regime.type.FIELDS)
end
