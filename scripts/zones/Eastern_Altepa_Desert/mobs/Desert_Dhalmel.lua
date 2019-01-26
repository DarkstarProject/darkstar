-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Desert Dhalmel
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 111, 3, dsp.regime.type.FIELDS)
end;
