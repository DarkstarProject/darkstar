-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Lacerator
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,734,1);
end;