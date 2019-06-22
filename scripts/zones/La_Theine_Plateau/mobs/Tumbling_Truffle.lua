-----------------------------------
-- Area: La Theine Plateau
--  MOB: Tumbling Truffle
-----------------------------------
require("scripts/globals/regimes")

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 71, 2, dsp.regime.type.FIELDS)
end;
