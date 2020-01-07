-----------------------------------
-- Area: West Ronfaure
--  Mob: Carrion Worm
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 1, 1, dsp.regime.type.FIELDS)
end
