-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Combat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,728,2);
end;