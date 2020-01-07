-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Goblin Gambler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 62, 2, dsp.regime.type.FIELDS)
end;
