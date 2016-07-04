-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Greater Gaylas
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,763,3);
end;