-----------------------------------
-- Area: West Ronfaure
--  MOB: Goblin Weaver
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 56, 2, dsp.regime.type.FIELDS)
end;
