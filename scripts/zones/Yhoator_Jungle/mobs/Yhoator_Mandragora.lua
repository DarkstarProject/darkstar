-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Yhoator Mandragora
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,130,1);
end;
