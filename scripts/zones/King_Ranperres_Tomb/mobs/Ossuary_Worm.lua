-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Ossuary Worm
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,636,1);
end;