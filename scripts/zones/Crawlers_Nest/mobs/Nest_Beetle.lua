-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Nest Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,688,2);
end;