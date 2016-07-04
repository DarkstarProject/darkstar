-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Mourning Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,726,3);
end;