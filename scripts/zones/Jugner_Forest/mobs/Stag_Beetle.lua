-----------------------------------
-- Area: Jugner Forest
--  MOB: Stag Beetle
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,12,1);
    checkRegime(player,mob,13,2);
end;
