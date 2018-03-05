-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Hecatomb Hound
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,612,1);
end;
