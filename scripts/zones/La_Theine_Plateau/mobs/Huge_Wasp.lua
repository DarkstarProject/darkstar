-----------------------------------
-- Area: La Theine Plateau
--  MOB: Huge Wasp
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 5, 2, dsp.regime.type.FIELDS)
end;
