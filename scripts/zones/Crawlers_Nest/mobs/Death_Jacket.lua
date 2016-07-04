-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Death Jacket
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,687,2);
end;