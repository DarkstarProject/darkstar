-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Sand Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 110, 3, dsp.regime.type.FIELDS)
end;
