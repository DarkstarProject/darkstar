-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Exoray
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,690,1);
end;