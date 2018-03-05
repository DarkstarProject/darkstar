-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Wind Bats
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,632,2);
end;