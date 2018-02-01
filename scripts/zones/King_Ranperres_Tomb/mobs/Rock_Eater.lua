-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Rock Eater
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,634,2);
end;