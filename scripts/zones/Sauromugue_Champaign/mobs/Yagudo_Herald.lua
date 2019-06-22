-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Yagudo Herald
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 99, 2, dsp.regime.type.FIELDS)
end
