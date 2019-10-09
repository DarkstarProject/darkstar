-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Yagudo Interrogator
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 99, 2, dsp.regime.type.FIELDS)
end
