-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Yhoator Wasp
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,130,2);
end;
