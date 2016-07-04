-----------------------------------
-- Area: Quicksand Caves
--  MOB: Sand Lizard
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,817,1);
end;