-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Blind Bat
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,615,1);
    checkGoVregime(player,mob,617,2);
end;
