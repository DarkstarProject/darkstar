-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Speculator
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 112, 3, dsp.regime.type.FIELDS)
end;
