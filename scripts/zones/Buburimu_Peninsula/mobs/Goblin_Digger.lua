-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Goblin Digger
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,62,2);
end;
