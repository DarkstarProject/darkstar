-----------------------------------
-- Area: North Gustaberg
--  MOB: Young Quadav
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,19,1);
    checkRegime(player,mob,59,1);
end;
