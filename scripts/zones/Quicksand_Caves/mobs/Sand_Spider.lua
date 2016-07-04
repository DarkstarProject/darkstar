-----------------------------------
-- Area: Quicksand Caves
--  MOB: Sand Spider
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,812,1);
end;