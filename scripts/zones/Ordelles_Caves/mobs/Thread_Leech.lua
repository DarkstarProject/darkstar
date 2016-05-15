-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Thread Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,655,2);
end;