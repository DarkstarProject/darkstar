-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Stroper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,660,2);
end;