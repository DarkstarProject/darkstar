-----------------------------------
-- Area: Valley of Sorrows
--  MOB: Velociraptor
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 139, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 140, 1, dsp.regime.type.FIELDS)
end;
