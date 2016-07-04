-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Greater Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,731,2);
end;