-----------------------------------
-- Area: East Ronfaure
--  Mob: Forest Hare
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 66, 1, dsp.regime.type.FIELDS)
end;
