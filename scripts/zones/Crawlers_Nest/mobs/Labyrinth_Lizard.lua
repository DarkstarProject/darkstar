-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Labyrinth Lizard
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,689,1);
end;