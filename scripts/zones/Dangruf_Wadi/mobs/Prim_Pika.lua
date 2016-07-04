-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Prim Pika
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,644,1);
end;