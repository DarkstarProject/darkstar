-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Patripatan
-----------------------------------
require("scripts/globals/regimes")

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 63, 1, dsp.regime.type.FIELDS)
end;
