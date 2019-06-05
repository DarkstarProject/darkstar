-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Sagittarius
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 112, 2, dsp.regime.type.FIELDS)
end;
