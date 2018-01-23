-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Lost Soul
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,103,2);
end;
