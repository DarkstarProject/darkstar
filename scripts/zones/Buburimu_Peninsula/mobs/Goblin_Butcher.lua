-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Goblin Butcher
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,62,2);
end;
