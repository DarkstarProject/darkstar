-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Lemures
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,636,2);
end;