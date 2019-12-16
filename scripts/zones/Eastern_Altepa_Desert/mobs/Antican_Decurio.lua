-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Antican Decurio
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 112, 1, dsp.regime.type.FIELDS)
end;
