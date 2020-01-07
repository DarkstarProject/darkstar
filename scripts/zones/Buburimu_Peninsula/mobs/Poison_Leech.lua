-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Poison Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 35, 1, dsp.regime.type.FIELDS)
end;
