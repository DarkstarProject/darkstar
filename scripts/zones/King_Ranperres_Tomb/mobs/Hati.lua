-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Hati
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,637,2);
end;