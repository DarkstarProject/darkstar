-----------------------------------
-- Area: Jugner Forest
--  MOB: Forest Leech
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,11,1);
    checkRegime(player,mob,12,2);
end;
