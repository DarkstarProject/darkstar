-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Thread Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,730,1);
end;