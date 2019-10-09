-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Antican Auxiliarius
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 110, 1, dsp.regime.type.FIELDS)
end;
