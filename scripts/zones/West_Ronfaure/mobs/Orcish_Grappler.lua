-----------------------------------
-- Area: West Ronfaure
--  MOB: Orcish Grappler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 4, 1, dsp.regime.type.FIELDS)
end;
