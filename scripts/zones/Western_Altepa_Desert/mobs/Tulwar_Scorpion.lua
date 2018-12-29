-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Tulwar Scorpion
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 137, 2, dsp.regime.type.FIELDS)
end
