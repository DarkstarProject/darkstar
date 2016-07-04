-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Dancing Jewel
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,694,1);
end;