-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Gigas Stonecarrier
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,733,1);
end;