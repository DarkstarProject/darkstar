-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Veteran Quadav
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,60,1);
end;
