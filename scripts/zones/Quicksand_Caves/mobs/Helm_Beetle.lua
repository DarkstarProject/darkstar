-----------------------------------
-- Area: Quicksand Caves
--  MOB: Helm Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,813,1);
end;