-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Goblin Weaver
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,631,2);
end;