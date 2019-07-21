-----------------------------------
-- Area: West Ronfaure
--  Mob: Forest Funguar
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 3, 2, dsp.regime.type.FIELDS)
end
