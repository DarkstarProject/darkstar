-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Helm Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,692,1);
end;