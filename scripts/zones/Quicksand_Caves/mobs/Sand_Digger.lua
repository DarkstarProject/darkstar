-----------------------------------
-- Area: Quicksand Caves
--  MOB: Sand Digger
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,814,1);
end;