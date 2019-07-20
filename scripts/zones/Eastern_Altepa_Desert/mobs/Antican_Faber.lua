-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Antican Faber
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 110, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 111, 2, dsp.regime.type.FIELDS)
end;
