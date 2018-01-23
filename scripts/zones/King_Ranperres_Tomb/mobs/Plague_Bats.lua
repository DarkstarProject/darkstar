-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Plague Bats
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,634,1);
end;