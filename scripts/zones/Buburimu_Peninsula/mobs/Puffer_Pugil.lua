-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Puffer Pugil
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,62,1);
end;
