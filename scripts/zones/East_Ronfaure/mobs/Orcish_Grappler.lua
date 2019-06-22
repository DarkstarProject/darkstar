-----------------------------------
-- Area: East Ronfaure
--  MOB: Orcish Grappler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 67, 1, dsp.regime.type.FIELDS)
end;
