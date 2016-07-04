-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Witch Hazel
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,689,2);
end;