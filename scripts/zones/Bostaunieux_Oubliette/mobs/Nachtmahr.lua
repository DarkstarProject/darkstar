-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Nachtmahr
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,616,1);
end;
