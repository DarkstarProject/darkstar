-----------------------------------
-- Area: La Theine Plateau
--  MOB: Akbaba
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 69, 2, dsp.regime.type.FIELDS)
end;
