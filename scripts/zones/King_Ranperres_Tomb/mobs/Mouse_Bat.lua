-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Mouse Bat
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,631,1);
end;