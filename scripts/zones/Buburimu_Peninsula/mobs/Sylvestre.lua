-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Sylvestre
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,32,1);
    checkRegime(player,mob,33,2);
end;
