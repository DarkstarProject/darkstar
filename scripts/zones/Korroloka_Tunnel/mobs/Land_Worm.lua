-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Land Worm
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,727,1);
end;