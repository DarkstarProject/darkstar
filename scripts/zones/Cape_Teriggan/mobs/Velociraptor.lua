-----------------------------------
-- Area: Cape Teriggan
--  Mob: Velociraptor
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 106, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 107, 1, dsp.regime.type.FIELDS)
end;
