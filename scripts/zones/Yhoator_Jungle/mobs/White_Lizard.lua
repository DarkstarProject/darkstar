-----------------------------------
-- Area: Yhoator Jungle
--  MOB: White Lizard
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,129,1);
end;
