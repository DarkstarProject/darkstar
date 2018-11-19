-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Goblin Mugger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 62, 2, dsp.regime.type.FIELDS)
end;
