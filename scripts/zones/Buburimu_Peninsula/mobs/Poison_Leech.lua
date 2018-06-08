-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Poison Leech
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,35,1);
end;
