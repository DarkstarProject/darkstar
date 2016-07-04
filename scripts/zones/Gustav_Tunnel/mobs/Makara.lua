-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Makara
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,764,2);
end;