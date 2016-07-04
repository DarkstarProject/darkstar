-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Goliath Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,660,1);
end;