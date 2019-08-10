-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Young Opo-opo
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 131, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 132, 2, dsp.regime.type.FIELDS)
end
