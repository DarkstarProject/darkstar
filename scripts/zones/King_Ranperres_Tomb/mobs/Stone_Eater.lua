-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Stone Eater
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,632,1);
end;