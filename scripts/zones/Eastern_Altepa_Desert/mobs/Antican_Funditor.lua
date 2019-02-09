-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Funditor
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 111, 1, dsp.regime.type.FIELDS)
end;
