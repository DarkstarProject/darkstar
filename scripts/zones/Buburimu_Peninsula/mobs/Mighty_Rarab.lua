-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Mighty Rarab
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,32,2);
end;
