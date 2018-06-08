-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Gadfly
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,21,1);
    checkRegime(player,mob,22,2);
end;
