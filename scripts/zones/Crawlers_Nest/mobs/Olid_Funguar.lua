-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Olid Funguar
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,694,2);
end;