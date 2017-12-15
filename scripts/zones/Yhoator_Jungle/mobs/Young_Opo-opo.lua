-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Young Opo-opo
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,131,1);
    checkRegime(player,mob,132,2);
end;
