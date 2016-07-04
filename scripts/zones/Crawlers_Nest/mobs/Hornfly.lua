-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Hornfly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,690,2);
end;