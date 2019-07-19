-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Champaign Coeurl
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 98, 1, dsp.regime.type.FIELDS)
end
