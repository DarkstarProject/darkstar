-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Lesser Manticore
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 112, 4, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 113, 4, dsp.regime.type.FIELDS)
end;
