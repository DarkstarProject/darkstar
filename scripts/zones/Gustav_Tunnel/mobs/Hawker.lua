-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Hawker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,764,1);
end;