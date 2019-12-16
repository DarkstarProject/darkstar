-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Yhoator Mandragora
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 130, 1, dsp.regime.type.FIELDS)
end
